module Main where

import qualified Euler.Problem001 as Problem001
import qualified Euler.Problem002 as Problem002

main :: IO ()
main = do
  putStr "Problem 001 solution: "
  print $ Problem001.solution 1000
  putStr "Problem 002 solution: "
  print $ Problem002.solution 4000000
