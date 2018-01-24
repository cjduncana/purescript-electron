module Electron.Remote.App (getAppPath, getPath, quit) where

import Control.Monad.Eff (Eff)
import Electron (ELECTRON)
import Electron.App (Path(AppData, Documents, Home))
import Prelude (Unit, (>>>))


-- | The current application directory.
-- |
-- | [Official Electron documentation](https://electronjs.org/docs/api/app#appgetapppath)
foreign import getAppPath :: forall eff. Eff (electron :: ELECTRON | eff) String

-- TODO: Remove this duplicate function when you figure out how to expose it
-- without it being part of the public API
-- Original function found in Electron.App
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
