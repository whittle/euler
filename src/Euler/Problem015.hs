-- Starting in the top left corner of a 2×2 grid, and only being able
-- to move to the right and down, there are exactly 6 routes to the
-- bottom right corner.

-- [[r,r,d,d], [r,d,r,d], [r,d,d,r], [d,r,r,d], [d,r,d,r], [d,d,r,r]]

-- How many such routes are there through a 20×20 grid?

module Euler.Problem015
       ( solution
       ) where

import Euler.Factorial (factorial)

-- Where n is the size of the grid, (2n)! / 2(n!)

solution :: Integer -> Integer
solution n = factorial (2 * n) `div` sq (factorial n)
  where sq i = i * i
