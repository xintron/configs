import XMonad
import XMonad.Actions.Navigation2D
import XMonad.Hooks.UrgencyHook
import XMonad.Util.Run

import Config

main :: IO ()
main = do
    spawnPipe "conky | dzen2 -x '455' -w '911' -p -ta r"
    xbar <- spawnPipe "dzen2 -w '455' -p -ta l"
    xmonad . withUrgencyHook NoUrgencyHook .  withNavigation2DConfig def $ myConfig xbar
