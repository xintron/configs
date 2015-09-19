import Data.Char (toLower)
import Data.List.Split (chunksOf)
import Numeric (readHex)
import Text.Printf (printf)

import qualified Graphics.UI.Gtk as Gtk
import System.Taffybar
import System.Taffybar.Battery
import System.Taffybar.MPRIS2
import System.Taffybar.NetMonitor
import System.Taffybar.Pager
import System.Taffybar.SimpleClock
import System.Taffybar.Systray
import System.Taffybar.TaffyPager
import System.Taffybar.Widgets.PollingGraph
import System.Taffybar.Widgets.PollingLabel

import System.Information.CPU
import System.Information.DiskIO
import System.Information.Memory

cpuCallback :: IO [Double]
cpuCallback = do
    (_, _, totalLoad) <- cpuLoad
    return [totalLoad]

cpuCall :: IO String
cpuCall = do
    (_, _, totalLoad) <- cpuLoad
    return $ show totalLoad

green :: String
green = "#B7F924"
red :: String
red = "#FF2A24"
blue :: String
blue = "#12D5D5"
yellow = "#f4bf75"

hexTuplify :: String -> (Double, Double, Double, Double)
hexTuplify = unlist . splitify
  where
    unlist (a:b:c:_) = (a, b, c, 1)
    unlist _ = (1, 0, 0, 1)
    splitify :: String -> [Double]
    splitify hex = take 3 . tuplify . chunksOf 2 $ filter (\x -> toLower x `elem` "123456789abcdef") hex
    tuplify :: [String] -> [Double]
    tuplify = map ((/ 255) . fst . head . readHex)

memToGB :: Int -> Double -> String
memToGB dec size = printf ("%." ++ show dec ++ "f") $ size / 1024

memLabel :: IO Gtk.Widget
memLabel = do
    label <- pollingLabelNew "" 2 $ do
        let color pct
              | pct < 0.5 = green
              | pct < 0.9 = yellow
              | otherwise = red
        mi <- parseMeminfo
        return $ "mem: <span fgcolor='" ++ color (memoryUsed mi / memoryTotal mi) ++ "'>"
            ++ memToGB 2 (memoryUsed mi)
            ++ "</span> / "
            ++ memToGB 2 (memoryTotal mi)
            ++ "GB"
    Gtk.widgetShowAll label
    return $ Gtk.toWidget label

main :: IO ()
main = do
    let cpuCfg = defaultGraphConfig { graphDataColors = repeat (hexTuplify green)
                                    , graphLabel = Just "cpu" }

        clock = textClockNew Nothing "<span fgcolor='#d58106'>%a %b %_d %H:%M:%S</span>" 1
        cpu = pollingGraphNew cpuCfg 1 cpuCallback
        inetformat = "<span fgcolor='" ++ green ++ "'>↓ $inKB$kB/s</span> <span fgcolor='" ++ red ++ "'>↑ $outKB$kB/s</span>"
        wlan = netMonitorNewWith 3 "wlp3s0" 1 inetformat
        wired = netMonitorNewWith 3 "eno1" 1 inetformat
        bat = batteryBarNew defaultBatteryConfig 30
        mpris = mpris2New

        pager = taffyPagerNew defaultPagerConfig
            { activeWindow = colorize green "" . escape . shorten 40
            , activeWorkspace = colorize green "" . wrap " " " " . escape
            , activeLayout = colorize "#E921A8" "" . escape
            , emptyWorkspace = const ""
            , visibleWorkspace = colorize blue "" . wrap " " " " . escape
            , urgentWorkspace = colorize red "" . wrap " " " " . escape
            , widgetSep = colorize "#EF3600" "" " : "
            }

    defaultTaffybar defaultTaffybarConfig { monitorNumber = 2
                                          , startWidgets = [ pager ]
                                          , endWidgets = [ systrayNew, clock, memLabel, cpu, wlan, wired, bat, mpris ] }
