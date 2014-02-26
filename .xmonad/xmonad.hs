import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Layout.NoBorders
import XMonad.Hooks.UrgencyHook
import XMonad.Layout.Renamed
import System.Exit

import qualified XMonad.Actions.ConstrainedResize as CR
import qualified XMonad.StackSet as W
import qualified Data.Map        as M

modMask' :: KeyMask
modMask' = mod4Mask

myConfig = def
    { terminal = "urxvt"
    , layoutHook = myLayouts
    , manageHook = myManageHook <+> manageDocks
    , keys = myKeys
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
toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask .|. controlMask, xK_b)

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

myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $
    [ ((modm, xK_Return), spawn $ XMonad.terminal conf)
    , ((modm, xK_r), spawn "dmenu_run -i -fn 'xft:Inconsolata-10'")
    -- close focused window
    , ((modm .|. shiftMask, xK_c), kill)
     -- Rotate through the available layout algorithms
    , ((modm, xK_space), sendMessage NextLayout)
    --  Reset the layouts on the current workspace to default
    , ((modm .|. shiftMask, xK_space ), setLayout $ XMonad.layoutHook conf)
    -- Resize viewed windows to the correct size
    , ((modm, xK_n), refresh)
    -- Move focus to the next window
    , ((modm, xK_Tab), windows W.focusDown)
    -- Move focus to the next window
    , ((modm, xK_j), windows W.focusDown)
    -- Move focus to the previous window
    , ((modm, xK_k), windows W.focusUp)
    -- Move focus to the master window
    , ((modm, xK_m), windows W.focusMaster)
    -- Swap the focused window and the master window
    , ((modm .|. shiftMask, xK_Tab), windows W.swapMaster)
    -- Swap the focused window with the next window
    , ((modm .|. shiftMask, xK_j), windows W.swapDown)
    -- Swap the focused window with the previous window
    , ((modm .|. shiftMask, xK_k), windows W.swapUp)
    -- Shrink the master area
    , ((modm, xK_h), sendMessage Shrink)
    -- Expand the master area
    , ((modm, xK_l), sendMessage Expand)
    -- Push window back into tiling
    , ((modm, xK_t), withFocused $ windows . W.sink)
    -- Increment the number of windows in the master area
    , ((modm, xK_comma), sendMessage (IncMasterN 1))
    -- Deincrement the number of windows in the master area
    , ((modm, xK_period), sendMessage (IncMasterN (-1)))
    -- Toggle the status bar gap
    -- Use this binding with avoidStruts from Hooks.ManageDocks.
    -- See also the statusBar function from Hooks.DynamicLog.
    --
    -- , ((modm, xK_b), sendMessage ToggleStruts)
    -- Quit xmonad
    , ((modm .|. shiftMask, xK_q), io (exitWith ExitSuccess))
    -- Restart xmonad
    , ((modm, xK_q), spawn "xmonad --recompile; xmonad --restart")
    ]
    ++
    --
    -- mod-[1..9], Switch to workspace N
    -- mod-shift-[1..9], Move client to workspace N
    --
    [((m .|. modm, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
    ++
    -- mod-{w,e,r}, Switch to physical/Xinerama screens 1, 2, or 3
    -- mod-shift-{w,e,r}, Move client to screen 1, 2, or 3
    --
    [((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
        | (key, sc) <- zip [xK_b, xK_m, xK_w, xK_v] [0..]
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]

main :: IO ()
main =
    xmonad . withUrgencyHook NoUrgencyHook =<< statusBar "xmobar" myPP toggleStrutsKey myConfig
