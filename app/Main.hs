module Main where

import qualified IFPL (someFunc)

main :: IO ()
main = do
  putStrLn "Hello, Haskell!"
  IFPL.someFunc
