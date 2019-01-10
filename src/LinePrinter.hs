module LinePrinter
  ( LinePrinter
  , printLine
  )
where

class Monad m => LinePrinter m
  where printLine :: String -> m ()
