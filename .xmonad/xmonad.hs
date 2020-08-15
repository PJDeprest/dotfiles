import XMonad
import XMonad.Actions.CycleWS
import XMonad.Config.Azerty
import qualified Data.Map as M -- necessary for azerty key config
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.SetWMName
import qualified XMonad.StackSet as W
import XMonad.Util.EZConfig(additionalKeysP)
import XMonad.Util.Run
import XMonad.Util.SpawnOnce

windowCount :: X (Maybe String)
windowCount = gets $ Just . show . length . W.integrate' . W.stack . W.workspace . W.current . windowset

myStartupHook = do
    spawnOnce "feh --bg-fill --randomize ~/Pictures/Wallpapers/Paintings/Landscapes/* &" 
    setWMName "LG3D" -- necessary for IntelliJ (and other Java Swing applications) to work

xmobarEscape :: String -> String
xmobarEscape = concatMap doubleLesserThanSign
  where
        doubleLesserThanSign '<' = "<<"
        doubleLesserThanSign x   = [x]

workspaceKeys = [1..6]
-- workspaceKeys = ["0x0026", "Eacute", "0x0022", "0x0027", "0x0028", "0x00a7"]

myWorkspaces :: [String]
myWorkspaces = clickable . (map xmobarEscape)
               $ ["1", "2", "3", "4", "5", "6"]
  where
        clickable l = [ "<action=`setxkbmap us && xdotool key super+" ++ show n ++ " && setxkbmap be`>" ++ ws ++ "</action>" |
                      (i,ws) <- zip workspaceKeys l,
                      let n = i ]


main = do
    xmproc <- spawnPipe "xmobar"
    xmonad $ docks def
        { modMask = mod4Mask 
        , workspaces = myWorkspaces
        , keys = \c -> azertyKeys c <+> keys def c
        , startupHook = myStartupHook
        , manageHook = manageDocks <+> manageHook def
        , layoutHook = avoidStruts  $  layoutHook def
        , logHook = dynamicLogWithPP xmobarPP
            { ppOutput = hPutStrLn xmproc
            , ppTitle = xmobarColor "#e1b61a" "" . shorten 60
            , ppCurrent = xmobarColor "#e1b61a" "" . wrap "[" "]"
            , ppVisible = xmobarColor "#e1b61a" "" . wrap " " " "
            , ppHidden = xmobarColor "#e1b61a" "" . wrap " " " "
            , ppHiddenNoWindows = xmobarColor "#666666" "" . wrap " " " "
            , ppSep =  "<fc=#444444> / </fc>"
            , ppExtras  = [windowCount]
            , ppOrder  = \(ws:l:t:ex) -> [ws,l]++ex++[t]
            }
        , focusedBorderColor = "#e1b61a"
        } `additionalKeysP`
            [ ("M-x w", spawn "firefox")
            , ("M-x i", spawn "intellij-idea-ultimate-edition")
            , ("M-x m", spawn "mysql-workbench")
            , ("M-b", sendMessage ToggleStruts)
            , ("M-<Left>", prevWS)
            , ("M-<Right>", nextWS)
            ]
