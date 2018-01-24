module Electron.App
  ( getAppPath
  , Path(AppData, Documents, Home)
  , getPath
  , quit
  , onActivate
  , onAllWindowsClosed
  , onReady
  ) where

import Control.Monad.Eff (Eff)
import Electron (ELECTRON)
import Prelude (Unit, (>>>))


-- | The current application directory.
-- |
-- | [Official Electron documentation](https://electronjs.org/docs/api/app#appgetapppath)
foreign import getAppPath :: forall eff. Eff (electron :: ELECTRON | eff) String


data Path
  = AppData
  | Documents
  | Home

-- TODO: Expose this function when you figure out how to expose a function
-- without it being part of the public API
-- Duplicate function found in Electron.Remote.App
stringifyPath :: Path -> String
stringifyPath =
  case _ of
    AppData -> "appData"
    Documents -> "documents"
    Home -> "home"

foreign import getPath_ :: forall eff. String -> Eff (electron :: ELECTRON | eff) String

-- | A path to a special directory or file.
-- |
-- | [Official Electron documentation](https://electronjs.org/docs/api/app#appgetpathname)
getPath :: forall eff. Path -> Eff (electron :: ELECTRON | eff) String
getPath =
  stringifyPath >>> getPath_


-- | Try to close all windows.
-- |
-- | [Official Electron documentation](https://electronjs.org/docs/api/app#appquit)
foreign import quit :: forall eff. Eff (electron :: ELECTRON | eff) Unit


-- | Emitted when the application is activated. Various actions can trigger this
-- | event, such as launching the application for the first time, attempting to
-- | re-launch the application when it's already running, or clicking on the
-- | application's dock or taskbar icon.
-- |
-- | [Official Electron documentation](https://electronjs.org/docs/api/app#event-activate-macos)
foreign import onActivate :: forall eff. Eff (electron :: ELECTRON | eff) Unit -> Eff (electron :: ELECTRON | eff) Unit


-- | If you do not subscribe to this event and all windows are closed, the
-- | default behavior is to quit the app; however, if you subscribe, you control
-- | whether the app quits or not.
-- |
-- | [Official Electron documentation](https://electronjs.org/docs/api/app#event-window-all-closed)
foreign import onAllWindowsClosed :: forall eff. Eff (electron :: ELECTRON | eff) Unit -> Eff (electron :: ELECTRON | eff) Unit


-- | Emitted when Electron has finished initialization.
-- |
-- | [Official Electron documentation](http://electron.atom.io/docs/all/#event-39-ready-39)
foreign import onReady :: forall eff. Eff (electron :: ELECTRON | eff) Unit -> Eff (electron :: ELECTRON | eff) Unit
