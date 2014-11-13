module Main where

import qualified Euler.Problem001 as Problem001

main :: IO ()
main = do
  putStr "Problem 001 solution: "
  print $ Problem001.solution 1000
