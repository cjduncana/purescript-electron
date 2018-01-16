module Electron (ELECTRON) where

import Control.Monad.Eff (kind Effect)

-- | The `ELECTRON` effect represents computations which require and affect the Electron environment.
foreign import data ELECTRON :: Effect
