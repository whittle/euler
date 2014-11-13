-- If we list all the natural numbers below 10 that are multiples of 3
-- or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

-- Find the sum of all the multiples of 3 or 5 below 1000.

module Euler.Problem001 (solution) where

solution :: Integer -> Integer
solution ceil = sum . filter mult . takeWhile (< ceil) $ iterate (+ 1) 1
  where mult i = (i `mod` 3 == 0) || (i `mod` 5 == 0)
