module Main where

import System.Environment (getArgs)
import Control.Monad (when)
import IFPL (exec)

main :: IO ()
main = do
  args <- getArgs
  when (length args /= 1)
    (error "Please provide only the path to the source code file")
  src <- readFile $ args !! 0
  putStrLn $ exec src
