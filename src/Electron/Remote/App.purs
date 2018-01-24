module Electron.Remote.App (getAppPath, getPath, quit) where

import Control.Monad.Eff (Eff)
import Electron (ELECTRON)
import Electron.App (Path)
import Prelude (Unit)


-- | The current application directory.
-- |
-- | [Official Electron documentation](https://electronjs.org/docs/api/app#appgetapppath)
foreign import getAppPath :: forall eff. Eff (electron :: ELECTRON | eff) String


-- | A path to a special directory or file.
-- |
-- | [Official Electron documentation](https://electronjs.org/docs/api/app#appgetpathname)
foreign import getPath :: forall eff. Path -> Eff (electron :: ELECTRON | eff) String


-- | Try to close all windows.
-- |
-- | [Official Electron documentation](https://electronjs.org/docs/api/app#appquit)
foreign import quit :: forall eff. Eff (electron :: ELECTRON | eff) Unit
