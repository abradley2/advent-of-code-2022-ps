module Util where

import Prelude
import Effect (Effect)
import Node.Encoding (Encoding(..))
import Node.FS.Sync (readTextFile)
import Data.Int as Int
import Data.Maybe (fromMaybe')
import Effect.Exception.Unsafe (unsafeThrow)

solveWithInput :: forall a. String -> (String -> a) -> Effect a
solveWithInput path f = (f <$> readTextFile UTF8 path)

readInt ∷ String → Int
readInt = Int.fromString >>> (fromMaybe' $ \_ -> unsafeThrow "Not an int")
