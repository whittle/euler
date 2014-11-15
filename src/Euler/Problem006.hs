-- The sum of the squares of the first ten natural numbers is,
-- 1^2 + 2^2 + ... + 10^2 = 385

-- The square of the sum of the first ten natural numbers is,
-- (1 + 2 + ... + 10)^2 = 552 = 3025

-- Hence the difference between the sum of the squares of the first
-- ten natural numbers and the square of the sum is 3025 − 385 = 2640.

-- Find the difference between the sum of the squares of the first one
-- hundred natural numbers and the square of the sum.

module Euler.Problem006
       ( solution
       ) where

-- Per http://planetmath.org/squareofsum
-- The square of a sum is equal to the sum of the squares of all the
-- summands plus the sum of all the double products of the summands in
-- twos. 

solution :: Integer -> Integer
solution ceil = 2 * sum [i * j | i <- [1..ceil], j <- [1..(i-1)]]
