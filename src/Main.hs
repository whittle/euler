module Main where

import qualified Euler.Problem001
import qualified Euler.Problem002
import qualified Euler.Problem003
import qualified Euler.Problem004

main :: IO ()
main = do
  label "001" $ Euler.Problem001.solution 1000
  label "002" $ Euler.Problem002.solution 4000000
  label "003" $ Euler.Problem003.solution 600851475143
  label "004" $ Euler.Problem004.solution 1000

label :: String -> Integer -> IO ()
label s i = do
  putStr $ "Problem " ++ s ++ " solution: "
  print i
