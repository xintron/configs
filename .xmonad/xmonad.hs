import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Layout.NoBorders
import XMonad.Hooks.UrgencyHook
import XMonad.Layout.Renamed

import qualified XMonad.Actions.ConstrainedResize as CR
import qualified XMonad.StackSet as W
import qualified Data.Map        as M

modMask' :: KeyMask
modMask' = mod4Mask

myConfig = def
    { terminal = "urxvt"
    , layoutHook = myLayouts
    , manageHook = myManageHook <+> manageDocks
    -- Don't be stupid with focus
    , focusFollowsMouse = False
    , clickJustFocuses = False
    , focusedBorderColor = "#99ff00"
    , workspaces = workspaces'
    , modMask = modMask' }

myPP = xmobarPP
    { ppCurrent = xmobarColor "#a9dc3a" "" . wrap "/" "/"
    , ppTitle = xmobarColor "#a9dc3a" "" . shorten 25
    , ppUrgent = xmobarColor "#fb1900" "" . wrap "*" "*" }
toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)

myLayouts = avoidStruts $ renamed [Replace "[]-"] tiled
             ||| renamed [Replace "M"] (Mirror tiled)
             ||| renamed [Replace "[]"] (noBorders Full)
  where
    tiled = smartBorders $ Tall 1 (3/100) (1/2)

workspaces' = ["1:web", "2:code", "3:media", "4:im", "5", "6", "7", "8", "9"]

myManageHook = composeAll
    [ className =? "MPlayer"        --> doFloat
    , className =? "Gimp"           --> doFloat
    , resource  =? "desktop_window" --> doIgnore
    , resource  =? "kdesktop"       --> doIgnore
    -- Flash :(
    , className =? "Plugin-container" --> doFloat
    , className =? "mpv" --> doFloat ]

main :: IO ()
main = 
    xmonad . withUrgencyHook NoUrgencyHook =<< statusBar "xmobar" myPP toggleStrutsKey myConfig
