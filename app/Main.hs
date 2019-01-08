module Main where

import           System.Environment             ( getArgs )

import           Lib                            ( fizzBuzz )

main :: IO ()
main = getArgs >>= fizzBuzz
