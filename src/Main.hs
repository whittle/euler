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
import qualified Euler.Problem010
import qualified Euler.Problem011
import qualified Euler.Problem012
import qualified Euler.Problem013
import qualified Euler.Problem014
import qualified Euler.Problem015
import qualified Euler.Problem016
import qualified Euler.Problem017
import qualified Euler.Problem018
import qualified Euler.Problem019
import qualified Euler.Problem020
import qualified Euler.Problem021
import qualified Euler.Problem022
import qualified Euler.Problem023
import qualified Euler.Problem024
import qualified Euler.Problem025
import qualified Euler.Problem026
import qualified Euler.Problem027
import qualified Euler.Problem028
import qualified Euler.Problem029

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
  label "010" $ Euler.Problem010.solution 2000000
  label "011" $ Euler.Problem011.solution 4
  label "012" $ Euler.Problem012.solution 500
  label "013" $ Euler.Problem013.solution 10
  label "014" $ Euler.Problem014.solution 1000000
  label "015" $ Euler.Problem015.solution 20
  label "016" $ Euler.Problem016.solution 1000
  label "017" $ Euler.Problem017.solution 1000
  file018 <- readFile "input/018.txt"
  label "018" $ Euler.Problem018.solution file018
  label "019" $ Euler.Problem019.solution (1901, 1, 1) (2000, 12, 31)
  label "020" $ Euler.Problem020.solution 100
  label "021" $ Euler.Problem021.solution 10000
  file022 <- readFile "input/022.txt"
  label "022" $ Euler.Problem022.solution file022
  label "023" $ Euler.Problem023.solution 28123
  label "024" $ Euler.Problem024.solution 1000000
  label "025" $ Euler.Problem025.solution 1000
  label "026" $ Euler.Problem026.solution (1000 :: Int)
  label "027" $ Euler.Problem027.solution (1000 :: Int)
  label "028" $ Euler.Problem028.solution (1001 :: Int)
  label "029" $ Euler.Problem029.solution (100 :: Int)

label :: Integral n => String -> n -> IO ()
label s i = do
  putStr $ "Problem " ++ s ++ " solution: "
  print $ toInteger i
