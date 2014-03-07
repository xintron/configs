module Config where
import XMonad
import XMonad.Actions.Navigation2D
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Layout.NoBorders
import XMonad.Util.Run
import System.Exit

import qualified XMonad.StackSet as W
import qualified Data.Map        as M

modMask' :: KeyMask
modMask' = mod4Mask

myLayouts = avoidStruts $ tiled
             ||| Mirror tiled
             ||| noBorders Full
  where
    tiled = smartBorders $ Tall 1 (3/100) (1/2)

workspaces' = clickable . (map dzenEscape) $
    ["1:web", "2:code", "3:media", "4:im", "5", "6", "7", "8", "9"]
  where
    clickable l =
        ["^ca(1, xdotool key super+" ++ show n ++ ")" ++ ws ++ "^ca()" |
        (ws, n) <- zip l [1..] ]

myManageHook = composeAll
    [ className =? "MPlayer"        --> doFloat
    , className =? "Gimp"           --> doFloat
    , resource  =? "desktop_window" --> doIgnore
    , resource  =? "kdesktop"       --> doIgnore
    -- Flash :(
    , className =? "Plugin-container" --> doFloat
    , className =? "mpv" --> doFloat
    , className =? "feh" --> doFloat
    , className =? "Steam" --> doFloat
    , className =? "Keepassx" --> doFloat
    , className =? "Gpick" --> doFloat ]

myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $
    [ ((modm, xK_Return), spawn $ XMonad.terminal conf)
    , ((modm, xK_r), spawn "dmenu_run -i -fn 'inconsolata:size=10' -nf '#a9dc3a' -sf '#fb5200' -nb '#000000' -sb '#000000'")
    -- close focused window
    , ((modm .|. shiftMask, xK_c), kill)
     -- Rotate through the available layout algorithms
    , ((modm, xK_space), sendMessage NextLayout)
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
    , ((modm, xK_q), spawn "killall conky dzen2 trayer; xmonad --recompile; xmonad --restart")

    -- 2D navigation
    , ((modm .|. shiftMask, xK_l), screenGo R True)
    , ((modm .|. shiftMask, xK_h), screenGo L True)
    , ((modm .|. controlMask, xK_l), screenSwap R True)
    , ((modm .|. controlMask, xK_h), screenSwap L True)

    -- Struts...
    , ((modm .|. controlMask, xK_0), sendMessage $ ToggleStrut U)
    ]
    ++
    --
    -- mod-[1..9], Switch to workspace N
    -- mod-shift-[1..9], Move client to workspace N
    --
    [((m .|. modm, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]

myPP h = defaultPP
    { ppCurrent = dzenColor "#a9dc3a" "" . wrap " " " "
    , ppVisible = dzenColor "#2fcad8" "" . wrap " " " "
    , ppWsSep = "  "
    , ppUrgent = dzenColor "#fb5200" ""
    , ppTitle = dzenColor "#ff3180" "" . shorten 30
    , ppLayout = dzenColor "#ffd33c" "" .
        (\x -> case x of
            "Tall"        -> "^i(/home/xintron/.xmonad/xbm/layout_tall.xbm)"
            "Mirror Tall" -> "^i(/home/xintron/.xmonad/xbm/layout_mirror_tall.xbm)"
            "Full"        -> "^i(/home/xintron/.xmonad/xbm/layout_full.xbm)"
            _             -> x)

    , ppOutput = hPutStrLn h }

myConfig bar = def
    { terminal = "urxvt"
    , layoutHook = myLayouts
    , manageHook = myManageHook <+> manageDocks
    , handleEventHook = docksEventHook
    , keys = myKeys
    , logHook = dynamicLogWithPP $ myPP bar
    -- Don't be stupid with focus
    , focusFollowsMouse = False
    , clickJustFocuses = False
    , focusedBorderColor = "#fb5200"
    , workspaces = workspaces'
    , modMask = modMask' }
