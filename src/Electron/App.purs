module Electron.App
  ( getAppPath
  , Path(AppData, Documents, Home)
  , getPath
  , quit
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


foreign import onAllWindowsClosed :: forall eff. Eff eff Unit -> Eff (electron :: ELECTRON | eff) Unit


-- | Emitted when Electron has finished initialization.
-- |
-- | [Official Electron documentation](http://electron.atom.io/docs/all/#event-39-ready-39)
foreign import onReady :: forall eff. Eff eff Unit -> Eff (electron :: ELECTRON | eff) Unit
