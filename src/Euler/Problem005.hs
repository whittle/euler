-- 2520 is the smallest number that can be divided by each of the
-- numbers from 1 to 10 without any remainder.

-- What is the smallest positive number that is evenly divisible by
-- all of the numbers from 1 to 20?

module Euler.Problem005
       ( solution
       ) where

solution :: Integer -> Integer
solution ceil = head . filter divisible $ [ceil, (2*ceil) ..]
  where divisible i = all (\j -> i `mod` j == 0) (ceil `downto` 1)

downto :: Integer -> Integer -> [Integer]
downto ceil = enumFromThenTo ceil $ ceil - 1
