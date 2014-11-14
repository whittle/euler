module Main where

import qualified Euler.Problem001
import qualified Euler.Problem002
import qualified Euler.Problem003

main :: IO ()
main = do
  putStr "Problem 001 solution: "
  print $ Euler.Problem001.solution 1000
  putStr "Problem 002 solution: "
  print $ Euler.Problem002.solution 4000000
  putStr "Problem 003 solution: "
  print $ Euler.Problem003.solution 600851475143
