module Main where

import           System.Environment             ( getArgs )

import           Lib                            ( fizzBuzz )
import           LinePrinter.IO

main :: IO ()
main = getArgs >>= fizzBuzz
