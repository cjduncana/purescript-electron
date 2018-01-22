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
import Prelude (Unit)


foreign import getAppPath :: forall eff. Eff (electron :: ELECTRON | eff) String


data Path
  = AppData
  | Documents
  | Home

foreign import getPath :: forall eff. Path -> Eff (electron :: ELECTRON | eff) String


foreign import quit :: forall eff. Eff (electron :: ELECTRON | eff) Unit


-- | Emitted when the application is activated. Various actions can trigger this
-- | event, such as launching the application for the first time, attempting to
-- | re-launch the application when it's already running, or clicking on the
-- | application's dock or taskbar icon.
-- |
-- | [Official Electron documentation](https://electronjs.org/docs/api/app#event-activate-macos)
foreign import onActivate :: forall eff. Eff eff Unit -> Eff (electron :: ELECTRON | eff) Unit


foreign import onAllWindowsClosed :: forall eff. Eff eff Unit -> Eff (electron :: ELECTRON | eff) Unit


-- | Emitted when Electron has finished initialization.
-- |
-- | [Official Electron documentation](http://electron.atom.io/docs/all/#event-39-ready-39)
foreign import onReady :: forall eff. Eff eff Unit -> Eff (electron :: ELECTRON | eff) Unit
