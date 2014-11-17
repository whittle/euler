-- A Pythagorean triplet is a set of three natural numbers, a < b < c,
-- for which, a^2 + b^2 = c^2

-- For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.

-- There exists exactly one Pythagorean triplet for which a + b + c =
-- 1000.  Find the product abc.

module Euler.Problem009
       ( solution
       , triplet
       ) where

import Control.Monad (guard)

solution :: Integer -> Integer
solution total = head $ do
  a <- [1..total]
  b <- [1..(total - a)]
  let c = total - (a + b)
  guard $ triplet a b c
  return $ a * b * c

triplet :: Integer -> Integer -> Integer -> Bool
triplet a b c = sqr a + sqr b == sqr c
  where sqr x = x^(2 :: Int)
