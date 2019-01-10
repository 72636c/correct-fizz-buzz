module FizzBuzzSpec
  ( fizzBuzzSpec
  )
where

import           GHC.Natural                    ( Natural )
import           Test.Hspec                     ( Spec
                                                , describe
                                                , hspec
                                                , it
                                                , shouldBe
                                                )

import           FizzBuzz                       ( fizzBuzz )
import           LinePrinter                    ( LinePrinter )
import           LinePrinter.Mock               ( MockLinePrinter
                                                , MockState(..)
                                                , runMockLinePrinter
                                                )

fizzBuzzSpec :: Spec
fizzBuzzSpec = do
  describe "fizzBuzz" $ do
    it "handles a count of 0" $ run 0 `shouldBe` []
    it "handles a count of 1" $ run 1 `shouldBe` ["1"]
    it "handles a count of 5" $ run 5 `shouldBe` ["Buzz", "4", "Fizz", "2", "1"]

run :: Natural -> [String]
run num =
  let args            = [show num]
      initialState    = MockState []
      test            = fizzBuzz args
      (_, finalState) = runMockLinePrinter test initialState
  in  cachedLines finalState
