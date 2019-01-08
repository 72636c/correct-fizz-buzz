module Lib
  ( fizzBuzz
  )
where

import           Control.Arrow                  ( (>>>) )
import           Data.Maybe                     ( fromMaybe )
import           GHC.Natural                    ( Natural )
import           Text.Read                      ( readMaybe )

fizzBuzz :: Arguments -> IO ()
fizzBuzz = getCount >>> toResults >>> mapM_ putStrLn

toResults :: Natural -> [Result]
toResults count = toResult <$> [1 .. count]

toResult :: Natural -> Result
toResult nat | nat `multipleOf` 3 && nat `multipleOf` 5 = "FizzBuzz"
             | nat `multipleOf` 3 = "Fizz"
             | nat `multipleOf` 5 = "Buzz"
             | otherwise          = show nat

defaultCount :: Natural
defaultCount = 100

getCount :: Arguments -> Natural
getCount [arg] = fromMaybe defaultCount (readMaybe arg :: Maybe Natural)
getCount _     = defaultCount

multipleOf :: Natural -> Natural -> Bool
multipleOf x y = x `mod` y == 0

type Arguments = [String]

type Result = String
