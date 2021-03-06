-- The sequence of triangle numbers is generated by adding the natural
-- numbers. So the 7th triangle number would be 1 + 2 + 3 + 4 + 5 + 6
-- + 7 = 28. The first ten terms would be:

-- 1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...

-- Let us list the factors of the first seven triangle numbers:

--      1: 1
--      3: 1,3
--      6: 1,2,3,6
--     10: 1,2,5,10
--     15: 1,3,5,15
--     21: 1,3,7,21
--     28: 1,2,4,7,14,28

-- We can see that 28 is the first triangle number to have over five
-- divisors.

-- What is the value of the first triangle number to have over five
-- hundred divisors?

module Euler.Problem012
       ( solution
       , divisors
       , triangles
       ) where

import Data.List (nub)

solution :: Int -> Integer
solution minDivs = head . filter f $ triangles
               where f = (> minDivs) . length . divisors

divisors :: Integer -> [Integer]
divisors n = nub . concatMap pair . filter f $ [1..(limit n)]
  where pair x = [x, div n x]
        f x = rem n x == 0
        limit = floor . sqrt . (fromIntegral :: Integer -> Double)

triangles :: [Integer]
triangles = scanl (+) 1 [2..]
