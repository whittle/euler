-- n! means n × (n − 1) × ... × 3 × 2 × 1

-- For example, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800, and the sum
-- of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.

-- Find the sum of the digits in the number 100!

module Euler.Problem020
       ( solution
       , sumOfDigits
       ) where

import Euler.Factorial (factorial)

solution :: Integer -> Integer
solution = sumOfDigits . factorial

sumOfDigits :: Integer -> Integer
sumOfDigits 0 = 0
sumOfDigits n = n `mod` 10 + sumOfDigits (n `div` 10)
