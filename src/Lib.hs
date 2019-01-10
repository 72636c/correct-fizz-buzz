module Lib
  ( fizzBuzz
  )
where

import           Control.Arrow                  ( (>>>) )
import           Control.Lens.Operators         ( (&)
                                                , (<&>)
                                                )
import           Data.Maybe                     ( fromMaybe
                                                , listToMaybe
                                                )
import           GHC.Natural                    ( Natural )
import           Text.Read                      ( readMaybe )

import           LinePrinter                    ( LinePrinter
                                                , printLine
                                                )

fizzBuzz :: LinePrinter m => Arguments -> m ()
fizzBuzz = readCount >>> generateResults >>> mapM_ printLine

generateResults :: Natural -> [Result]
generateResults count = [1 .. count] <&> toResult

toResult :: Natural -> Result
toResult num | num `multipleOf` 3 && num `multipleOf` 5 = "FizzBuzz"
             | num `multipleOf` 3 = "Fizz"
             | num `multipleOf` 5 = "Buzz"
             | otherwise          = show num

defaultCount :: Natural
defaultCount = 100

readCount :: Arguments -> Natural
readCount args = listToMaybe args >>= readMaybe & fromMaybe defaultCount

multipleOf :: Integral a => a -> a -> Bool
multipleOf x y = x `mod` y == 0

type Arguments = [String]

type Result = String
