import XMonad
import XMonad.Actions.Navigation2D
import XMonad.Hooks.EwmhDesktops (ewmh)
import XMonad.Hooks.UrgencyHook
import XMonad.Util.Run

import System.Taffybar.Hooks.PagerHints (pagerHints)

import Config

main :: IO ()
main = do
    spawnPipe "taffybar"
    xmonad . pagerHints . ewmh . withUrgencyHook NoUrgencyHook .
        withNavigation2DConfig defaultNavigation2DConfig $
            myConfig
