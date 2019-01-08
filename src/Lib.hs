module Lib
  ( fizzBuzz
  )
where

import           Data.Maybe                     ( fromMaybe
                                                , listToMaybe
                                                )
import           GHC.Natural                    ( Natural )
import           Text.Read                      ( readMaybe )

class Monad m => LinePrinter m
  where printLine :: String -> m ()

instance LinePrinter IO
  where printLine = putStrLn

fizzBuzz :: LinePrinter m => Arguments -> m ()
fizzBuzz = mapM_ printLine . generateResults . readCount

generateResults :: Natural -> [Result]
generateResults count = toResult <$> [1 .. count]

toResult :: Natural -> Result
toResult num | num `multipleOf` 3 && num `multipleOf` 5 = "FizzBuzz"
             | num `multipleOf` 3 = "Fizz"
             | num `multipleOf` 5 = "Buzz"
             | otherwise          = show num

defaultCount :: Natural
defaultCount = 100

readCount :: Arguments -> Natural
readCount args = fromMaybe defaultCount $ readMaybe =<< listToMaybe args

multipleOf :: Integral a => a -> a -> Bool
multipleOf x y = x `mod` y == 0

type Arguments = [String]

type Result = String
