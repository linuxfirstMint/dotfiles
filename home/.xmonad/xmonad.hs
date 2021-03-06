--
-- xmonad example config file.
--
-- A template showing all available configuration hooks,
-- and how to override the defaults in your own xmonad.hs conf file.
--
-- Normally, you'd only override those defaults you care about.
--

import XMonad
import Data.Monoid()
import System.Exit

import qualified XMonad.StackSet as W
import qualified Data.Map        as M

import XMonad.Layout.Spacing
import XMonad.Layout.Renamed

import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.SetWMName
import XMonad.Hooks.InsertPosition
import XMonad.Hooks.FadeInactive()

import XMonad.Actions.SpawnOn

-- The preferred terminal program, which is used in a binding below and by
-- certain contrib modules.
--
--myTerminal      = "gnome-terminal"
--myTerminal      = "alacritty"
--myTerminal      = "urxvt -e zsh -c \"tmux new-session\""
--myTerminal      = "urxvj"
myTerminal        = "urxvt -e zsh"
-- Whether focus follows the mouse pointer.
myFocusFollowsMouse :: Bool
myFocusFollowsMouse = False

-- Whether clicking on a window to focus also passes the click to the window
myClickJustFocuses :: Bool
myClickJustFocuses = False

-- Width of the window border in pixels.
--
myBorderWidth   = 4

-- modMask lets you specify which modkey you want to use. The default
-- is mod1Mask ("left alt").  You may also consider using mod3Mask
-- ("right alt"), which does not conflict with emacs keybindings. The
-- "windows key" is usually mod4Mask.
--
myModMask       = mod4Mask

-- The default number of workspaces (virtual screens) and their names.
-- By default we use numeric strings, but any string may be used as a
-- workspace name. The number of workspaces is determined by the length
-- of this list.
--
-- A tagging example:

myWorkspaces = ["web", "code", "moni", "free"]

--wk = myWorkspaces !! 3
--myWorkspaces = ["web", "code", "moni"] ++ map show [4..9]
--myWorkspaces = ["web", "irc", "code" ]
--myWorkspaces    = ["壱","弐","参","肆","伍","陸","漆","捌","玖"]
--myWorkspaces    = ["1","2","3","4","5","6","7","8","9"]
--myWorkspaces    = ["1","2","3","4","5"]
-- Border colors for unfocused and focused windows, respectively.
--
myNormalBorderColor  = darkBlack_Color
myFocusedBorderColor = darkGreen_Color


-- Color palette
--

fullBlack_Color   = "#000000"
darkBlack_Color  = "#1a1a1a"
darkGray_Color    = "#4e4e4e"
darkAshGray_Color = "#919191"
darkWhite_Color   = "#dee9f2"
darkBlue_Color    = "#02bdc7"
darkGreen_Color   = "#64c74c"
darkYellow_Color  = "#ffb600"
darkPink_Color    = "#fc4067"
darkRed_Color     = "#ff0d0d"
brightPink_Color  = "#ff8ca4"

------------------------------------------------------------------------
-- Key bindings. Add, modify or remove key bindings here.
--
myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $

    -- launch a terminal
    [ ((modm,               xK_Return), spawn $ XMonad.terminal conf)

    -- launch dmenu
    , ((modm,               xK_p         ), spawn "dmenu_run -l 10 -m 1")


    -- close focused window
    , ((modm,               xK_c     ), kill)

     -- Rotate through the available layout algorithms
    , ((modm,               xK_space ), sendMessage NextLayout)

    --  Reset the layouts on the current workspace to default
    , ((modm .|. shiftMask, xK_space ), setLayout $ XMonad.layoutHook conf)

    -- Resize viewed windows to the correct size
    , ((modm,               xK_n     ), refresh)

    -- Move focus to the next window
    , ((modm,               xK_Tab   ), windows W.focusDown)

    -- Move focus to the next window
    , ((modm,               xK_j     ), windows W.focusDown)

    -- Move focus to the previous window
    , ((modm,               xK_k     ), windows W.focusUp  )

    -- Move focus to the master window
    , ((modm,               xK_m     ), windows W.focusMaster  )

    -- Swap the focused window and the master window
    --, ((modm .|. shiftMask,               xK_Return), windows W.swapMaster)

    -- Swap the focused window with the next window
    , ((modm .|. shiftMask, xK_j     ), windows W.swapDown  )

    -- Swap the focused window with the previous window
    , ((modm .|. shiftMask, xK_k     ), windows W.swapUp    )

    -- Shrink the master area
    , ((modm,               xK_h     ), sendMessage Shrink)

    -- Expand the master area
    , ((modm,               xK_l     ), sendMessage Expand)

    -- Push window back into tiling
    , ((modm,               xK_t     ), withFocused $ windows . W.sink)

    -- Increment the number of windows in the master area
    , ((modm              , xK_comma ), sendMessage (IncMasterN 1))

    -- Deincrement the number of windows in the master area
    , ((modm              , xK_period), sendMessage (IncMasterN (-1)))

    -- Toggle the status bar gap
    -- Use this binding with avoidStruts from Hooks.ManageDocks.
    -- See also the statusBar function from Hooks.DynamicLog.
    --
    -- , ((modm              , xK_b     ), sendMessage ToggleStruts)

    -- Quit xmonad
    , ((modm,               xK_Escape), io (exitWith ExitSuccess))

    -- Restart xmonad
    , ((modm .|. shiftMask, xK_r), spawn "xmonad --recompile; xmonad --restart")

    -- Run xmessage with a summary of the default keybindings (useful for beginners)
    , ((modm .|. shiftMask, xK_slash ), spawn ("echo \"" ++ help ++ "\" | xmessage -file -"))

    -- AlsaMixer
    , ((modm,               xK_minus     ), spawn "amixer -q set Master 2%-"   )
    , ((modm .|. shiftMask, xK_semicolon ), spawn "amixer -q set Master 2%+"   )
    , ((modm .|. shiftMask, xK_m         ), spawn "amixer -q set Master toggle")

    -- XScreenSaver
    , ((modm .|. shiftMask, xK_l         ), spawn "xscreensaver-command -lock")

    ]
    ++

    --
    -- mod-[1..4], Switch to workspace N
    -- mod-shift-[1..4], Move client to workspace N
    --
    [((m .|. modm, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_4]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
    ++

    --
    -- mod-{w,e,r}, Switch to physical/Xinerama screens 1, 2, or 3
    -- mod-shift-{w,e,r}, Move client to screen 1, 2, or 3
    --
    [((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
        | (key, sc) <- zip [xK_q, xK_w, xK_e] [0..]
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]


------------------------------------------------------------------------
-- Mouse bindings: default actions bound to mouse events
--
myMouseBindings (XConfig {XMonad.modMask = modm}) = M.fromList $

    -- mod-button1, Set the window to floating mode and move by dragging
    [ ((modm, button1), (\w -> focus w >> mouseMoveWindow w
                                       >> windows W.shiftMaster))

    -- mod-button2, Raise the window to the top of the stack
    , ((modm, button2), (\w -> focus w >> windows W.shiftMaster))

    -- mod-button3, Set the window to floating mode and resize by dragging
    , ((modm, button3), (\w -> focus w >> mouseResizeWindow w
                                       >> windows W.shiftMaster))

    -- you may also bind events to the mouse scroll wheel (button4 and button5)
    ]

------------------------------------------------------------------------
-- Layouts:

-- You can specify and transform your layouts by modifying these values.
-- If you change layout bindings be sure to use 'mod-shift-space' after
-- restarting (with 'mod-q') to reset your layout state to the new
-- defaults, as xmonad preserves your old layout settings by default.
--
-- The available layouts.  Note that each layout is separated by |||,
-- which denotes layout choice.
--
myLayout = avoidStruts standardLayout
  where
     standardLayout =   renamed [Replace "Tall"] tiled
                    ||| renamed [Replace "Mirror Tall"] (Mirror tiled)
                    ||| renamed [Replace "Full"] Full
     -- default tiling algorithm partitions the screen into two panes
     --tiled   = spacing 10 $ Tall nmaster delta ratio
     tiled   = spacing 4 $ Tall nmaster delta ratio
     -- The default number of windows in the master pane
     nmaster = 1
     -- Default proportion of screen occupied by master pane
     ratio   = 1/2
     -- Percent of screen to increment by when resizing panes
     delta   = 3/100

------------------------------------------------------------------------
-- Window rules:

-- Execute arbitrary actions and WindowSet manipulations when managing
-- a new window. You can use this to, for example, always float a
-- particular program, or have a client always appear on a particular
-- workspace.
--
-- To find the property name associated with a program, use
-- > xprop | grep WM_CLASS
-- and click on the client you're interested in.
--
-- To match on the WM_NAME, you can use 'title' in the same way that
-- 'className' and 'resource' are used below.
--
myManageHook = composeAll
   [ className =? "MPlayer"                -->  doFloat
    --, className =? "Gimp"                -->  doFloat
    , className =? "brightness-controller" -->  doFloat
    , resource  =? "desktop_window"        -->  doIgnore
    , resource  =? "kdesktop"              -->  doIgnore
    --, className =? "Mikutter.rb"         -->  doShift (myWorkspaces !! 1)
    --, className =? "Mikutter.rb"         -->  doShift (myWorkspaces !! 2)
    , className =? "firefox"         -->  doShift "web"
    --, className =? "Mikutter.rb"         -->  doShift (myWorkspaces !! 0)
    --, className =? "Corebird"            -->  doShift (myWorkspaces !! 0)
    --, className =? "/usr/bin/firefox"      -->  doShift (myWorkspaces !! 0)
    --, className =? "Doublecmd"           -->  doShift (myWorkspaces !! 2)
    --, className =? "Chromium"            -->  doShift (myWorkspaces !! 4)
    --, className =? "V2C"                 -->  doShift (myWorkspaces !! 7)
    --, className =? "Eclipse"             -->  doShift (myWorkspaces !! 6)
    -- 新しいウィンドウを末尾に追加しフォーカスする
    , not <$> isFloat                      -->  insertPosition End Newer
   ]
  where
    isFloat = liftX $ do
      floats <- gets $ W.floating . windowset
      ws <- gets $ W.integrate' . W.stack . W.workspace . W.current . windowset
      return $ any (flip M.member floats) ws

------------------------------------------------------------------------
-- Event handling

-- * EwmhDesktops users should change this to ewmhDesktopsEventHook
--
-- Defines a custom handler function for X Events. The function should
-- return (All True) if the default handler is to be run afterwards. To
-- combine event hooks use mappend or mconcat from Data.Monoid.
--
--myEventHook = mempty
myEventHook = docksEventHook -- 初期起動時 xmobarに重なるの防止

------------------------------------------------------------------------
-- Status bars and logging

-- Perform an arbitrary action on each internal state change or X event.
-- See the 'XMonad.Hooks.DynamicLog' extension for examples.
--
myLogHook = return ()
-- myLogHook = fadeOrigLogHook fadeAmount
--   where
--     fadeAmount = 0.8
--     fadeOrigLogHook = fadeOutLogHook . fadeIf fadeSomeWindows
--     fadeSomeWindows = className =? "URxvt"



myXmobarPP = xmobarPP
  {
    ppVisible           =   xmobarColor darkWhite_Color  fullBlack_Color . pad
  , ppHidden            =   xmobarColor darkBlue_Color   fullBlack_Color . pad
  , ppHiddenNoWindows   =   xmobarColor darkGray_Color   fullBlack_Color . pad
  , ppUrgent            =   xmobarColor darkRed_Color    fullBlack_Color . pad
  , ppCurrent           =   xmobarColor brightPink_Color fullBlack_Color . pad . wrap "[" "]"
  , ppTitle             =   xmobarColor darkWhite_Color  fullBlack_Color . shorten 30
  , ppLayout            =   xmobarColor darkBlue_Color   fullBlack_Color
  --, ppSep             =
  --, ppWsSep           =
  --, ppTitleSanitize   =
  --, ppOrder           =
  --, ppSort            =
  --, ppExtras          =
  --, ppOutput          =
  }

------------------------------------------------------------------------
-- Startup hook

-- Perform an arbitrary action each time xmonad starts or is restarted
-- with mod-q.  Used by, e.g., XMonad.Layout.PerWorkspace to initialize
-- per-workspace layout choices.
--
-- By default, do nothing.
-- myStartupHook = return ()
myStartupHook = do
  spawn "compton -c -r 2 -o 0.8 -l -2 -t -2"
  --spawn "xscreensaver"
  setWMName "LG3D"  -- for java apps
  --spawnOn "3" "firefox"
  --spawn "gnome-terminal"
  --spawnOn "free" "gnome-terminal"
  --spawnOn "free" "firefox"
  --spawnOn "myWorkspaces !! 3" "firefox"
  --spawnOn "wk" "firefox"

------------------------------------------------------------------------
-- Now run xmonad with all the defaults we set up.

-- Run xmonad with the settings you specify. No need to modify this.
--
--main = xmonad =<< xmobar defaults
--main = xmonad defaults
main = do
  -- The main function.
  xmonad =<< statusBar myBar myPP toggleStrutsKey myConfig
  where
    -- Command to launch the bar.
    myBar = "xmobar $HOME/.xmobarrc"
    -- Custom PP, configure it as you like. It determines what is being written to the bar.
    --myPP = xmobarPP { ppCurrent = xmobarColor darkGreen_Color "" . wrap "<" ">" }
    myPP = myXmobarPP
    -- Key binding to toggle the gap for the bar.
    toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)
    -- Main configuration, override the defaults to your liking.
    -- myConfig = defaultConfig { modMask = mod4Mask }
    myConfig = defaults

-- A structure containing your configuration settings, overriding
-- fields in the default config. Any you don't override, will
-- use the defaults defined in xmonad/XMonad/Config.hs
--
-- No need to modify this.
--
defaults = def {
      -- simple stuff
        terminal           = myTerminal,
        focusFollowsMouse  = myFocusFollowsMouse,
        clickJustFocuses   = myClickJustFocuses,
        borderWidth        = myBorderWidth,
        modMask            = myModMask,
        workspaces         = myWorkspaces,
        normalBorderColor  = myNormalBorderColor,
        focusedBorderColor = myFocusedBorderColor,

      -- key bindings
        keys               = myKeys,
        mouseBindings      = myMouseBindings,

      -- hooks, layouts
        layoutHook         = myLayout,
        manageHook         = myManageHook,
        handleEventHook    = myEventHook,
        logHook            = myLogHook,
        startupHook        = myStartupHook
    }

-- | Finally, a copy of the default bindings in simple textual tabular format.
help :: String
help = "https://wiki.haskell.org/File:Xmbindings.png"
