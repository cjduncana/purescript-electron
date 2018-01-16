module Electron.Types (Listener, Channel, mkListener) where

import Control.Monad.Eff (Eff, kind Effect)
import Electron.Event (Event)
import Prelude (Unit)

-- | A boxed function that can be used as an event listener. This is necessary
-- | due to the underling implementation of Eff functions.
foreign import data Listener :: # Effect -> Type

-- | Creates a Listener from a normal PureScript Eff function.
foreign import mkListener :: forall eff m. (Event -> m -> Eff eff Unit) -> Listener eff

type Channel = String
