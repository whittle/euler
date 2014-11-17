module Main where

import qualified Euler.Problem001
import qualified Euler.Problem002
import qualified Euler.Problem003
import qualified Euler.Problem004
import qualified Euler.Problem005
import qualified Euler.Problem006
import qualified Euler.Problem007
import qualified Euler.Problem008
import qualified Euler.Problem009

main :: IO ()
main = do
  label "001" $ Euler.Problem001.solution 1000
  label "002" $ Euler.Problem002.solution 4000000
  label "003" $ Euler.Problem003.solution 600851475143
  label "004" $ Euler.Problem004.solution 1000
  label "005" $ Euler.Problem005.solution 20
  label "006" $ Euler.Problem006.solution 100
  label "007" $ Euler.Problem007.solution 10001
  label "008" $ Euler.Problem008.solution 13
  label "009" $ Euler.Problem009.solution 1000

label :: String -> Integer -> IO ()
label s i = do
  putStr $ "Problem " ++ s ++ " solution: "
  print i
