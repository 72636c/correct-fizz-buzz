module Main where

import           System.Environment             ( getArgs )

import           FizzBuzz                       ( fizzBuzz )
import           LinePrinter.IO

main :: IO ()
main = getArgs >>= fizzBuzz
