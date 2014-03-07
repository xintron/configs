import XMonad
import XMonad.Actions.Navigation2D
import XMonad.Hooks.UrgencyHook
import XMonad.Util.Run

import Config

main :: IO ()
main = do
    spawnPipe "conky | dzen2 -bg '#000000' -x '455' -w '831' -p -ta r"
    spawnPipe "trayer --edge top --align right --widthtype pixel --width 80 --transparent true --tint 0x000000 --height 20 --alpha 0 --expand false"
    xbar <- spawnPipe "dzen2 -bg '#000000' -w '455' -p -ta l"
    xmonad . withUrgencyHook NoUrgencyHook .  withNavigation2DConfig def $ myConfig xbar
