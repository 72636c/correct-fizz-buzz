module Main where

import           Test.Hspec                     ( hspec )

import           FizzBuzzSpec                   ( fizzBuzzSpec )

main :: IO ()
main = hspec fizzBuzzSpec
