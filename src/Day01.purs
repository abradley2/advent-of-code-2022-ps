module Day01 where

import Prelude
import Data.Array as Array
import Data.Foldable (foldl, maximum)
import Data.String (Pattern(..), split)
import Util (readInt)
import Data.Maybe (fromMaybe')
import Effect.Exception.Unsafe (unsafeThrow)

parseInput ∷ String → Array (Array Int)
parseInput =
  (split (Pattern "\n\n"))
    >>> (map (split (Pattern "\n") >>> map readInt))

part1 :: String -> Int
part1 =
  parseInput
    >>> map (foldl (+) 0)
    >>> maximum
    >>> fromMaybe' (\_ -> unsafeThrow "No solution")

part2 ∷ String → Int
part2 =
  parseInput
    >>> map (foldl (+) 0)
    >>> Array.sort
    >>> Array.reverse
    >>> Array.take 3
    >>> (foldl (+) 0)
