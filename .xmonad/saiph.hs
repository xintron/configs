import XMonad
import XMonad.Actions.Navigation2D
import XMonad.Hooks.UrgencyHook
import XMonad.Util.Run

import Config

main :: IO ()
main = do
    xmonad . withUrgencyHook NoUrgencyHook .  withNavigation2DConfig def $ myConfig xbar
