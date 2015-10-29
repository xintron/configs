{-# OPTIONS_GHC -fno-warn-missing-signatures #-}
module Config where
import XMonad
import XMonad.Actions.FloatKeys
import XMonad.Actions.FloatSnap
import XMonad.Actions.GridSelect
import XMonad.Actions.Navigation2D
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.Minimize
import qualified XMonad.Layout.BoringWindows as B
import XMonad.Layout.Dishes
import XMonad.Layout.LimitWindows
import XMonad.Layout.Maximize
import XMonad.Layout.Minimize
import XMonad.Layout.NoBorders
import XMonad.Layout.OneBig
import XMonad.Layout.Renamed
import XMonad.Layout.Tabbed
import System.Exit

import qualified XMonad.StackSet as W
import qualified Data.Map        as M

modMask' :: KeyMask
modMask' = mod4Mask

delta :: Rational
delta = 3 / 100

green = "#B7F924"
red = "#FF2A24"

layWebDev = renamed [Replace "Log"] $ Mirror $ Tall 1 delta (8/10)
layMain = renamed [Replace "Main"] $ Tall 1 delta (1 / 2)
layFull = noBorders Full
layDish = limitSlice 5 $ Dishes 1 (1 / 5)
layOneBig = renamed [Replace "Big"] $ OneBig (3/4) (3/4)
layTabbed = renamed [Replace "Tab"] $ tabbedBottom shrinkText $ defaultTheme
    { activeColor = bg
    , urgentColor = red
    , inactiveColor = bg
    , activeBorderColor = bg
    , inactiveBorderColor = bg
    , urgentBorderColor = red
    , inactiveTextColor = infg -- Gray color on dark gray background
    , activeTextColor = green
    , urgentTextColor = "#ffffff"
    , fontName = "xft:Liberation Sans:size=10" }
  where
    bg = "#222222"
    infg = "#cccccc"

allLayouts = layMain ||| layWebDev ||| layTabbed ||| layFull ||| layOneBig
devFirst = layWebDev ||| layMain ||| layTabbed ||| layFull
mainFirst = layMain ||| layTabbed ||| layFull

myLayouts = avoidStruts $ smartBorders
    -- Renamed removes the Maximize + Minimized from the layout name
    $ renamed [CutWordsLeft 2 ] $ maximize $ minimize
    $ B.boringWindows allLayouts

switchWorkspaceToWindow :: Window -> X ()
switchWorkspaceToWindow w = windows $ do
    tag <- W.currentTag
    W.focusWindow w . W.greedyView tag . W.focusWindow w

workspaces' = ["1:web", "2:code", "3:media", "4:im", "5", "6", "7", "8", "9"]

myManageHook = composeAll
    [ className =? "MPlayer"          --> doFloat
    , className =? "Gimp"             --> doFloat
    , resource  =? "desktop_window"   --> doIgnore
    , resource  =? "kdesktop"         --> doIgnore
    -- Flash :(
    , className =? "Plugin-container" --> doFloat
    , className =? "mpv"              --> doFloat
    , className =? "feh"              --> doFloat
    , className =? "keepassx"         --> doFloat
    , className =? "Gpick"            --> doFloat
    , className =? "Thunar"           --> doFloat
    -- Used by Chromium developer tools, maybe other apps as well
    , role =? "pop-up"                --> doFloat ]
  where
    role = stringProperty "WM_WINDOW_ROLE"

myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $
    [ ((modm, xK_Return), spawn $ XMonad.terminal conf)
    , ((modm .|. shiftMask, xK_F9), spawn "kodi")
    , ((modm, xK_r), spawn "rofi -show run -switchers 'run,window' -no-levenshtein-sort")
    , ((modm .|. shiftMask, xK_r), spawn "rofi-mainmenu")
    -- close focused window
    , ((modm .|. shiftMask, xK_c), kill)
     -- Rotate through the available layout algorithms
    , ((modm, xK_space), sendMessage NextLayout)
    , ((modm .|. shiftMask, xK_space), setLayout $ XMonad.layoutHook conf)
    -- Resize viewed windows to the correct size
    , ((modm, xK_n), refresh)
    -- Move focus to the next window
    , ((modm, xK_Tab), B.focusDown)
    -- Move focus to the next window
    , ((modm, xK_j), B.focusDown)
    -- Move focus to the previous window
    , ((modm, xK_k), B.focusUp)
    -- Move focus to the master window
    , ((modm, xK_m), B.focusMaster)
    -- Swap the focused window with the master window
    , ((modm .|. shiftMask, xK_m), windows W.swapMaster)
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
    -- Quit xmonad
    , ((modm .|. shiftMask, xK_q), io exitSuccess)
    -- Restart xmonad
    , ((modm, xK_q), spawn "killall taffybar-linux-x86_64; xmonad --recompile; xmonad --restart")

    -- 2D navigation
    , ((modm .|. shiftMask, xK_l), screenGo R True)
    , ((modm .|. shiftMask, xK_h), screenGo L True)
    , ((modm .|. controlMask, xK_l), screenSwap R True)
    , ((modm .|. controlMask, xK_h), screenSwap L True)

    -- Float handling (snapping to edges)
    , ((modm, xK_Right), withFocused $ snapMove R Nothing)
    , ((modm, xK_Left), withFocused $ snapMove L Nothing)
    , ((modm, xK_Up), withFocused $ snapMove U Nothing)
    , ((modm, xK_Down), withFocused $ snapMove D Nothing)

    , ((modm .|. shiftMask, xK_Right), withFocused $ keysResizeWindow (20, 0) (0, 0))
    , ((modm .|. shiftMask, xK_Left), withFocused $ keysResizeWindow (-20, 0) (0, 0))
    , ((modm .|. shiftMask, xK_Up), withFocused $ keysResizeWindow (0, -20) (0, 0))
    , ((modm .|. shiftMask, xK_Down), withFocused $ keysResizeWindow (0, 20) (0, 0))

    -- Make focused window maximized
    , ((modm, xK_z), withFocused (sendMessage . maximizeRestore))
    -- Minimize stuff
    , ((modm, xK_v), withFocused minimizeWindow)
    , ((modm .|. shiftMask, xK_v), sendMessage RestoreNextMinimizedWin)
    -- This is the magic of gridselect
    , ((modm, xK_g), withSelectedWindow switchWorkspaceToWindow defaultGSConfig)
    , ((modm .|. shiftMask, xK_g), gridselectWorkspace defaultGSConfig W.greedyView)
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

myConfig = defaultConfig
    { terminal = "urxvt"
    , layoutHook = myLayouts
    , manageHook = myManageHook <+> manageDocks
    , handleEventHook = docksEventHook <+> minimizeEventHook
    , keys = myKeys
    -- Don't be stupid with focus
    , focusFollowsMouse = False
    , clickJustFocuses = False
    , focusedBorderColor = green
    , workspaces = workspaces'
    , modMask = modMask' }
