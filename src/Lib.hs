module Lib
  ( fizzBuzz
  , generateResults
  )
where

import           Control.Arrow                  ( (>>>) )
import           Data.Maybe                     ( fromMaybe )
import           GHC.Natural                    ( Natural )
import           Text.Read                      ( readMaybe )

fizzBuzz :: Arguments -> IO ()
fizzBuzz = getCount >>> generateResults >>> mapM_ putStrLn

generateResults :: Natural -> [Result]
generateResults count = toResult <$> [1 .. count]

toResult :: Natural -> Result
toResult num | num `multipleOf` 3 && num `multipleOf` 5 = "FizzBuzz"
             | num `multipleOf` 3 = "Fizz"
             | num `multipleOf` 5 = "Buzz"
             | otherwise          = show num

defaultCount :: Natural
defaultCount = 100

getCount :: Arguments -> Natural
getCount [arg] = fromMaybe defaultCount (readMaybe arg :: Maybe Natural)
getCount _     = defaultCount

multipleOf :: Integral a => a -> a -> Bool
multipleOf x y = x `mod` y == 0

type Arguments = [String]

type Result = String
