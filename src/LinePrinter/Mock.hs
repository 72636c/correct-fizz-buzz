{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE TypeSynonymInstances #-}

module LinePrinter.Mock
  ( MockLinePrinter
  , MockState(..)
  , runMockLinePrinter
  )
where

import           Control.Monad.State            ( State
                                                , modify
                                                , runState
                                                )
import           LinePrinter                    ( LinePrinter
                                                , printLine
                                                )

newtype MockState = MockState
  { cachedLines  :: [String]
  }
  deriving (Show, Eq)

type MockLinePrinter = State MockState

runMockLinePrinter :: MockLinePrinter a -> MockState -> (a, MockState)
runMockLinePrinter = runState

instance LinePrinter MockLinePrinter where
  printLine str = modify $
    \state -> state { cachedLines = str : cachedLines state }
