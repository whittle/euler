-- Starting in the top left corner of a 2×2 grid, and only being able
-- to move to the right and down, there are exactly 6 routes to the
-- bottom right corner.

-- [[r,r,d,d], [r,d,r,d], [r,d,d,r], [d,r,r,d], [d,r,d,r], [d,d,r,r]]

-- How many such routes are there through a 20×20 grid?

module Euler.Problem015
       ( solution
       , fact
       ) where

-- Where n is the size of the grid, (2n)! / 2(n!)

solution :: Integer -> Integer
solution n = fact (2 * n) `div` sq (fact n)
  where sq i = i * i

fact :: Integer -> Integer
fact 1 = 1
fact n = n * fact (n - 1)

