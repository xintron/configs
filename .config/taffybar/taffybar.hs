import Data.Char (toLower)
import Data.List.Split (chunksOf)
import Numeric (readHex)

import System.Taffybar
import System.Taffybar.Battery
import System.Taffybar.MPRIS2
import System.Taffybar.NetMonitor
import System.Taffybar.Pager
import System.Taffybar.SimpleClock
import System.Taffybar.Systray
import System.Taffybar.TaffyPager
import System.Taffybar.Widgets.PollingGraph

import System.Information.CPU
import System.Information.Memory

cpuCallback :: IO [Double]
cpuCallback = do
    (_, _, totalLoad) <- cpuLoad
    return [totalLoad]

memCallback :: IO [Double]
memCallback = do
    mi <- parseMeminfo
    return [memoryUsedRatio mi]

green :: String
green = "#B7F924"
red :: String
red = "#FF2A24"
blue :: String
blue = "#12D5D5"

hexTuplify :: String -> (Double, Double, Double, Double)
hexTuplify = unlist . splitify
  where
    unlist (a:b:c:_) = (a, b, c, 1)
    unlist _ = (1, 0, 0, 1)
    splitify :: String -> [Double]
    splitify hex = take 3 . tuplify . chunksOf 2 $ filter (\x -> toLower x `elem` "123456789abcdef") hex
    tuplify :: [String] -> [Double]
    tuplify = map ((/ 255) . fst . head . readHex)

main :: IO ()
main = do
    let cpuCfg = defaultGraphConfig { graphDataColors = [hexTuplify green
                                                        ,(0.02, 0.443, 0.565, 1)]
                                    , graphLabel = Just "cpu"
                                    }
        memCfg = defaultGraphConfig { graphDataColors = [hexTuplify red]
                                    , graphLabel = Just "mem"
                                    }
    let clock = textClockNew Nothing "<span fgcolor='#d58106'>%a %b %_d %H:%M:%S</span>" 1
        cpu = pollingGraphNew cpuCfg 1 cpuCallback
        mem = pollingGraphNew memCfg 1 memCallback
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

    defaultTaffybar defaultTaffybarConfig { monitorNumber = 1
                                          , startWidgets = [ pager ]
                                          , endWidgets = [ systrayNew, clock, mem, cpu, wlan, wired, bat, mpris ] }
