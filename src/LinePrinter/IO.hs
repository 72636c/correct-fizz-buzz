module LinePrinter.IO where

import           LinePrinter                    ( LinePrinter
                                                , printLine
                                                )

instance LinePrinter IO
  where printLine = putStrLn
