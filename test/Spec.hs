import           GHC.Natural                    ( Natural )
import           Test.Hspec                     ( Spec
                                                , describe
                                                , hspec
                                                , it
                                                , shouldBe
                                                )

import           Lib                            ( fizzBuzz )
import           LinePrinter                    ( LinePrinter )
import           LinePrinter.Mock               ( MockLinePrinter
                                                , MockState(..)
                                                , runMockLinePrinter
                                                )

main :: IO ()
main = hspec spec

spec :: Spec
spec = do
  describe "fizzBuzz" $ do
    it "handles a count of 0" $ runFizzBuzz 0 `shouldBe` []

    it "handles a count of 1" $ runFizzBuzz 1 `shouldBe` ["1"]

    it "handles a count of 5"
      $          runFizzBuzz 5
      `shouldBe` ["Buzz", "4", "Fizz", "2", "1"]

runFizzBuzz :: Natural -> [String]
runFizzBuzz num =
  let args            = [show num]
      initialState    = MockState []
      test            = fizzBuzz args
      (_, finalState) = runMockLinePrinter test initialState
  in  cachedLines finalState
