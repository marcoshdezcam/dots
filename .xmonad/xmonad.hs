import System.IO
import System.Exit

import XMonad
import XMonad.Hooks.SetWMName
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageHelpers(doFullFloat, doCenterFloat, isFullscreen, isDialog)
import XMonad.Config.Desktop
import XMonad.Config.Azerty
import XMonad.Util.Run(spawnPipe)
import XMonad.Actions.SpawnOn
import XMonad.Util.EZConfig (additionalKeys, additionalMouseBindings)
import XMonad.Actions.CycleWS
import XMonad.Hooks.UrgencyHook
import qualified Codec.Binary.UTF8.String as UTF8

import XMonad.Layout.Spacing
import XMonad.Layout.Gaps
import XMonad.Layout.ResizableTile
---import XMonad.Layout.NoBorders
import XMonad.Layout.Fullscreen (fullscreenFull)
import XMonad.Layout.Cross(simpleCross)
import XMonad.Layout.Spiral(spiral)
import XMonad.Layout.ThreeColumns
import XMonad.Layout.MultiToggle
import XMonad.Layout.MultiToggle.Instances
import XMonad.Layout.IndependentScreens


import XMonad.Layout.CenteredMaster(centerMaster)

import Graphics.X11.ExtraTypes.XF86
import qualified XMonad.StackSet as W
import qualified Data.Map as M
import qualified Data.ByteString as B
import Control.Monad (liftM2)
import qualified DBus as D
import qualified DBus.Client as D
import XMonad.Util.SpawnOnce

----------------------------------------------------------------------
------------------------ RUN AT STARTUP ------------------------------ 
----------------------------------------------------------------------
myStartupHook = do
    spawn "$HOME/.xmonad/scripts/autostart.sh"
    setWMName "TILab"
    spawnOnce "autorandr --change"
----------------------------------------------------------------------
---------------------------- COLORS ----------------------------------
----------------------------------------------------------------------
normBord = "#4c566a"
focdBord = "#5e81ac"
fore     = "#DEE3E0"
back     = "#282c34"
winType  = "#c678dd"
----------------------------------------------------------------------
------------------------ BASIC VARIABLES------------------------------
----------------------------------------------------------------------
myModMask = mod4Mask
encodeCChar = map fromIntegral . B.unpack
myFocusFollowsMouse = True
myBorderWidth = 2
------------------- Code     Docs      Git      Web       VM       Zoom      Chat      Play    Settings  Productivity
myWorkspaces    = ["\61728","\61485","\61595","\62057", "\62003", "\61501", "\61574", "\61515", "\61459", "\62068"]
----------------------------------------------------------------------
------------------------ WINDOW MANIPULATIONS ------------------------
----------------------------------------------------------------------
myBaseConfig = desktopConfig
myManageHook = composeAll . concat $
    [ [isDialog --> doCenterFloat]
    , [className =? c --> doCenterFloat | c <- myCFloats]
    , [title =? t --> doFloat | t <- myTFloats]
    , [resource =? r --> doFloat | r <- myRFloats]
    , [resource =? i --> doIgnore | i <- myIgnores]
    -- , [(className =? x <||> title =? x <||> resource =? x) --> doShiftAndGo "\61612" | x <- my1Shifts]
    -- , [(className =? x <||> title =? x <||> resource =? x) --> doShiftAndGo "\61899" | x <- my2Shifts]
    -- , [(className =? x <||> title =? x <||> resource =? x) --> doShiftAndGo "\61947" | x <- my3Shifts]
    -- , [(className =? x <||> title =? x <||> resource =? x) --> doShiftAndGo "\61635" | x <- my4Shifts]
    -- , [(className =? x <||> title =? x <||> resource =? x) --> doShiftAndGo "\61502" | x <- my5Shifts]
    -- , [(className =? x <||> title =? x <||> resource =? x) --> doShiftAndGo "\61501" | x <- my6Shifts]
    -- , [(className =? x <||> title =? x <||> resource =? x) --> doShiftAndGo "\61705" | x <- my7Shifts]
    -- , [(className =? x <||> title =? x <||> resource =? x) --> doShiftAndGo "\61564" | x <- my8Shifts]
    -- , [(className =? x <||> title =? x <||> resource =? x) --> doShiftAndGo "\62150" | x <- my9Shifts]
    -- , [(className =? x <||> title =? x <||> resource =? x) --> doShiftAndGo "\61872" | x <- my10Shifts]
    ]
    where
    -- doShiftAndGo = doF . liftM2 (.) W.greedyView W.shift
    myCFloats = 
      ["Arandr"
      , "Arcolinux-tweak-tool.py"
      , "Arcolinux-welcome-app.py"
      , "Galculator"
      , "feh"
      , "mpv"
      , "Xfce4-terminal"
      , "MEGAsync"
      , "zoom"
      , "Pamac-manager"
      , "Slack"
      , "Thunar"
      , "Chromium"
      , "Spotify"
      , "Caprine"
      , "whatsapp-nativefier-d40211"
      , "Blueberry.py"
      , "Pavucontrol"
      , "Arcologout.py"
      , "Gnome-disks"
      , "GitKraken"
      , "Variety"
      ]
    myTFloats = ["Downloads", "Save As..."]
    myRFloats = []
    myIgnores = ["desktop_window"]
    -- my1Shifts = ["Chromium", "Vivaldi-stable", "Firefox"]
    -- my2Shifts = []
    -- my3Shifts = ["Inkscape"]
    -- my4Shifts = []
    -- my5Shifts = ["Gimp", "feh"]
    -- my6Shifts = ["vlc", "mpv"]
    -- my7Shifts = ["Virtualbox"]
    -- my8Shifts = ["Thunar"]
    -- my9Shifts = []
    -- my10Shifts = ["discord"]
----------------------------------------------------------------------
------------------------------ LAYOUTS -------------------------------
----------------------------------------------------------------------
myLayout = spacingRaw True (Border 0 5 5 5) True (Border 5 5 5 5) True $ avoidStruts $ mkToggle (NBFULL ?? NOBORDERS ?? EOT) $ tiled ||| Mirror tiled ||| spiral (6/7)  ||| ThreeColMid 1 (3/100) (1/2) ||| Full
    where
        tiled = Tall nmaster delta tiled_ratio
        nmaster = 1
        delta = 3/100
        tiled_ratio = 1/2
myMouseBindings (XConfig {XMonad.modMask = modMask}) = M.fromList $
--------------------------- mod-button1, Set the window to floating mode and move by dragging
    [ ((modMask, 1), (\w -> focus w >> mouseMoveWindow w >> windows W.shiftMaster))
--------------------------- mod-button2, Raise the window to the top of the stack
    , ((modMask, 2), (\w -> focus w >> windows W.shiftMaster))
--------------------------- mod-button3, Set the window to floating mode and resize by dragging
    , ((modMask, 3), (\w -> focus w >> mouseResizeWindow w >> windows W.shiftMaster))
    ]
----------------------------------------------------------------------
------------------------ KEY MAPPINGS -------------------------------- 
----------------------------------------------------------------------
myKeys conf@(XConfig {XMonad.modMask = modMask}) = M.fromList $
----------------------------------------------------------------------
------- LAUNCH FAVORITE APPS -------------------------- SUPER + F KEYS
----------------------------------------------------------------------
  [ ((modMask, xK_f), sendMessage $ Toggle NBFULL)
  , ((modMask, xK_q), kill )
  , ((modMask, xK_v), spawn $ "pavucontrol" )
  , ((modMask, xK_y), spawn $ "polybar-msg cmd toggle" )
  , ((modMask, xK_x), spawn $ "arcolinux-logout" )
  , ((modMask, xK_Escape), spawn $ "xkill" )
  , ((modMask, xK_Return), spawn $ "alacritty" )

  , ((modMask, xK_F1), spawn $ "firefox" )
  , ((modMask, xK_F2), spawn $ "brave" )
  , ((modMask, xK_F3), spawn $ "chromium" )
  , ((modMask, xK_F4), spawn $ "emacs" )

  , ((modMask, xK_F5), spawn $ "gitkraken" )
  , ((modMask, xK_F6), spawn $ "joplin" )
  , ((modMask, xK_F7), spawn $ "cacher" )
  , ((modMask, xK_F8), spawn $ "spotify" )

  , ((modMask, xK_F9), spawn $ "blueberry" )
  , ((modMask, xK_F10), spawn $ "pavucontrol" )
  , ((modMask, xK_F11), spawn $ "rofi -show run -fullscreen" )
  , ((modMask, xK_F12), spawn $ "rofi -show run" )
----------------------------------------------------------------------
--------------------------------------------------------------- F KEYS
----------------------------------------------------------------------
  , ((0, xK_F12), spawn $ "xfce4-terminal --drop-down" )
----------------------------------------------------------------------
-------------------------------------------------------- SUPER + SHIFT 
----------------------------------------------------------------------
  , ((modMask .|. shiftMask , xK_Return ), spawn $ "thunar")
  , ((modMask .|. shiftMask , xK_d ), spawn $ "dmenu_run -i -nb '#191919' -nf '#fea63c' -sb '#fea63c' -sf '#191919' -fn 'NotoMonoRegular:bold:pixelsize=14'")
  , ((modMask .|. shiftMask , xK_r ), spawn $ "xmonad --recompile && xmonad --restart")
  , ((modMask .|. shiftMask , xK_q ), kill)
  -- , ((modMask .|. shiftMask , xK_x ), io (exitWith ExitSuccess))
----------------------------------------------------------------------
-------------------------------------------------------- CONTROL + ALT
----------------------------------------------------------------------
--  , ((controlMask .|. mod1Mask , xK_Next ), spawn $ "conky-rotate -n")
--  , ((controlMask .|. mod1Mask , xK_Prior ), spawn $ "conky-rotate -p")
  --, ((controlMask .|. mod1Mask , xK_a ), spawn $ "xfce4-appfinder")
  --, ((controlMask .|. mod1Mask , xK_b ), spawn $ "thunar")
  --, ((controlMask .|. mod1Mask , xK_e ), spawn $ "arcolinux-tweak-tool")
  -- , ((controlMask .|. mod1Mask , xK_f ), spawn $ "firefox")
  --, ((controlMask .|. mod1Mask , xK_g ), spawn $ "chromium -no-default-browser-check")
  --, ((controlMask .|. mod1Mask , xK_i ), spawn $ "nitrogen")
  --, ((controlMask .|. mod1Mask , xK_k ), spawn $ "arcolinux-logout")
  --, ((controlMask .|. mod1Mask , xK_l ), spawn $ "arcolinux-logout")
  --, ((controlMask .|. mod1Mask , xK_m ), spawn $ "xfce4-settings-manager")
  --, ((controlMask .|. mod1Mask , xK_o ), spawn $ "$HOME/.xmonad/scripts/picom-toggle.sh")
  --, ((controlMask .|. mod1Mask , xK_p ), spawn $ "pamac-manager")
  , ((controlMask .|. mod1Mask , xK_r ), spawn $ "rofi-theme-selector")
  --, ((controlMask .|. mod1Mask , xK_s ), spawn $ "spotify")
  --, ((controlMask .|. mod1Mask , xK_t ), spawn $ "urxvt")
  --, ((controlMask .|. mod1Mask , xK_u ), spawn $ "pavucontrol")

----------------------------------------------------------------------
------------------------ VARIETY BACKGROUNDS -------------- CTRL + ALT
----------------------------------------------------------------------
--  , ((mod1Mask, xK_f), spawn $ "variety -f" )
--  , ((mod1Mask, xK_n), spawn $ "variety -n" )
--  , ((mod1Mask, xK_p), spawn $ "variety -p" )
--  , ((mod1Mask, xK_t), spawn $ "variety -t" )
--  , ((mod1Mask, xK_Up), spawn $ "variety --pause" )
--  , ((mod1Mask, xK_Down), spawn $ "variety --resume" )
--  , ((mod1Mask, xK_Left), spawn $ "variety -p" )
--  , ((mod1Mask, xK_Right), spawn $ "variety -n" )
----------------------------------------------------------------------
------------------------------------------------------------ ALT + ... 
----------------------------------------------------------------------
--  , ((mod1Mask, xK_r), spawn $ "xmonad --restart" )
--  , ((mod1Mask, xK_F2), spawn $ "gmrun" )
--  , ((mod1Mask, xK_F3), spawn $ "xfce4-appfinder" )
----------------------------------------------------------------------
-------------------------------------------------------CONTROL + SHIFT
----------------------------------------------------------------------
  , ((controlMask .|. shiftMask , xK_Escape ), spawn $ "xfce4-taskmanager")
----------------------------------------------------------------------
----------------------------------------------------------- SCREENSHOT
----------------------------------------------------------------------
  , ((0, xK_Print), spawn $ "flameshot gui")
----------------------------------------------------------------------
------------------------------------------------------ MULTIMEDIA KEYS
----------------------------------------------------------------------
 ---------------------------  -- Mute volume
  , ((0, xF86XK_AudioMute), spawn $ "amixer -q set Master toggle")
 ---------------------------  -- Decrease volume
  , ((0, xF86XK_AudioLowerVolume), spawn $ "amixer -q set Master 5%-")
 ---------------------------  -- Increase volume
  , ((0, xF86XK_AudioRaiseVolume), spawn $ "amixer -q set Master 5%+")
 ---------------------------  -- Increase brightness
  , ((0, xF86XK_MonBrightnessUp),  spawn $ "xbacklight -inc 5")
 ---------------------------  -- Decrease brightness
  , ((0, xF86XK_MonBrightnessDown), spawn $ "xbacklight -dec 5")
--  , ((0, xF86XK_AudioPlay), spawn $ "mpc toggle")
--  , ((0, xF86XK_AudioNext), spawn $ "mpc next")
--  , ((0, xF86XK_AudioPrev), spawn $ "mpc prev")
--  , ((0, xF86XK_AudioStop), spawn $ "mpc stop")
  , ((0, xF86XK_AudioPlay), spawn $ "playerctl play-pause")
  , ((0, xF86XK_AudioNext), spawn $ "playerctl next")
  , ((0, xF86XK_AudioPrev), spawn $ "playerctl previous")
  , ((0, xF86XK_AudioStop), spawn $ "playerctl stop")
-------------------------------------------------------------------------
------------------------  XMONAD LAYOUT KEY MAPPINGS --------------------
-------------------------------------------------------------------------
--------------------------- Cycle through the available layout algorithms.
  , ((modMask, xK_space), sendMessage NextLayout)
--------------------------- Focus selected desktop
  , ((mod1Mask, xK_Tab), nextWS)
--------------------------- Focus selected desktop
  , ((modMask, xK_Tab), nextWS)
--------------------------- Focus selected desktop
  , ((controlMask .|. mod1Mask , xK_Left ), prevWS)
--------------------------- Focus selected desktop
  , ((controlMask .|. mod1Mask , xK_Right ), nextWS)
--------------------------- Reset the layouts on the current workspace to default.
  , ((modMask .|. shiftMask, xK_space), setLayout $ XMonad.layoutHook conf)
--------------------------- Move focus to the next window.
  , ((modMask, xK_j), windows W.focusDown)
--------------------------- Move focus to the previous window.
  , ((modMask, xK_k), windows W.focusUp  )
--------------------------- Move focus to the master window.
  , ((modMask .|. shiftMask, xK_m), windows W.focusMaster  )
--------------------------- Swap the focused window with the next window.
  , ((modMask .|. shiftMask, xK_j), windows W.swapDown  )
--------------------------- Swap the focused window with the next window.
  , ((controlMask .|. modMask, xK_Down), windows W.swapDown  )
--------------------------- Swap the focused window with the previous window.
  , ((modMask .|. shiftMask, xK_k), windows W.swapUp    )
--------------------------- Swap the focused window with the previous window.
  , ((controlMask .|. modMask, xK_Up), windows W.swapUp  )
--------------------------- Push window back into tiling.
  , ((controlMask .|. shiftMask , xK_t), withFocused $ windows . W.sink)

-------------------------------------------------------------------------
--------------------------------------------------------- WINDOW RESIZING
-------------------------------------------------------------------------
--------------------------- Shrink the master area.
  , ((controlMask .|. modMask , xK_h), sendMessage Shrink)
--------------------------- Expand the master area.
  , ((controlMask .|. modMask , xK_l), sendMessage Expand)
--------------------------- Expand the master area.
  , ((controlMask .|. modMask , xK_j), sendMessage MirrorShrink)
--------------------------- Expand the master area.
  , ((controlMask .|. modMask , xK_k), sendMessage MirrorExpand)
-------------------------------------------------------------------------
------------------------------------------------------------- MASTER AREA
-------------------------------------------------------------------------
--------------------------- Increment the number of windows in the master area.
  , ((controlMask .|. modMask, xK_Left), sendMessage (IncMasterN 1))
--------------------------- Decrement the number of windows in the master area.
  , ((controlMask .|. modMask, xK_Right), sendMessage (IncMasterN (-1)))
  ]
  ++
--------------------------- mod-[1..9], Switch to workspace N
--------------------------- mod-shift-[1..9], Move client to workspace N
  [((m .|. modMask, k), windows $ f i)
----------------------------------------------------------------------
----------------------------------------------------- Keyboard layouts
----------------------------------------------------------------------
   | (i, k) <- zip (XMonad.workspaces conf) [xK_1,xK_2,xK_3,xK_4,xK_5,xK_6,xK_7,xK_8,xK_9,xK_0]
      , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)
      , (\i -> W.greedyView i . W.shift i, shiftMask)]]
--------------------------- ctrl-{w,e,r}, Switch to physical/Xinerama screens 1, 2, or 3
--------------------------- ctrl-shift-{w,e,r}, Move client to screen 1, 2, or 3
-- ++
--  [((m .|. controlMask, key), screenWorkspace sc >>= flip whenJust (windows . f))
--      | (key, sc) <- zip [xK_w, xK_e] [0..]
--      , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]
----------------------------------------------------------------------
------------------------------------- RUN XMONAD WITH CUSTOM VARIABLES
----------------------------------------------------------------------
main :: IO ()
main = do
    dbus <- D.connectSession
----------------------------------------------------------------------
 ------------------------------------- Request access to the DBus name
----------------------------------------------------------------------
    D.requestName dbus (D.busName_ "org.xmonad.Log")
        [D.nameAllowReplacement, D.nameReplaceExisting, D.nameDoNotQueue]
    xmonad . ewmh $
            myBaseConfig
                  {startupHook = myStartupHook
, layoutHook = gaps [(U,35), (D,5), (R,5), (L,5)] $ myLayout ||| layoutHook myBaseConfig
, manageHook = manageSpawn <+> myManageHook <+> manageHook myBaseConfig
, modMask = myModMask
, borderWidth = myBorderWidth
, handleEventHook    = handleEventHook myBaseConfig <+> fullscreenEventHook
, focusFollowsMouse = myFocusFollowsMouse
, workspaces = myWorkspaces
, focusedBorderColor = focdBord
, normalBorderColor = normBord
, keys = myKeys
, mouseBindings = myMouseBindings
}
