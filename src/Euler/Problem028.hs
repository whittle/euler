-- Starting with the number 1 and moving to the right in a clockwise
-- direction a 5 by 5 spiral is formed as follows:

-- 21 22 23 24 25
-- 20  7  8  9 10
-- 19  6  1  2 11
-- 18  5  4  3 12
-- 17 16 15 14 13

-- It can be verified that the sum of the numbers on the diagonals is
-- 101.

-- What is the sum of the numbers on the diagonals in a 1001 by 1001
-- spiral formed in the same way?

module Euler.Problem028
       ( solution
       , ulamsSpiralDiagonalsFor
       ) where

solution :: Integral a => a -> a
solution = sum . ulamsSpiralDiagonalsFor

ulamsSpiralDiagonalsFor :: Integral a => a -> [a]
ulamsSpiralDiagonalsFor n = 1 : do
  let kmax = (n + 1) `div` 2 - 1
  k <- [1..kmax]
  j <- [1..4]
  return $ 4*k*k + (2*j - 4) * k + 1
