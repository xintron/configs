import XMonad
import XMonad.Actions.Navigation2D
import XMonad.Hooks.EwmhDesktops (ewmh)
import XMonad.Hooks.DynamicLog (dynamicLogWithPP)
import XMonad.Hooks.UrgencyHook
import XMonad.Util.Run

import qualified DBus as D
import qualified DBus.Client as D

import Config

main :: IO ()
main = do
    dbus <- D.connectSession
    -- Request access to the DBus name
    D.requestName dbus (D.busName_ "org.xmonad.Log")
        [D.nameAllowReplacement, D.nameReplaceExisting, D.nameDoNotQueue]

    xmonad . ewmh . withUrgencyHook NoUrgencyHook .
        withNavigation2DConfig defaultNavigation2DConfig $
            myConfig
                { logHook = dynamicLogWithPP (myDbusHook dbus)
				, startupHook = spawn "polybar-restart" }
