-- Let d(n) be defined as the sum of proper divisors of n (numbers
-- less than n which divide evenly into n).  If d(a) = b and d(b) = a,
-- where a ≠ b, then a and b are an amicable pair and each of a and b
-- are called amicable numbers.

-- For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20,
-- 22, 44, 55 and 110; therefore d(220) = 284. The proper divisors of
-- 284 are 1, 2, 4, 71 and 142; so d(284) = 220.

-- Evaluate the sum of all the amicable numbers under 10000.

module Euler.Problem021
       ( solution
       , amicable
       , divisors
       ) where

import Data.Function.Memoize

solution :: Integer -> Integer
solution n = sum $ filter amicable [1..(pred n)]

amicable :: Integer -> Bool
amicable n = n /= once && n == twice
  where once = sumOfDivisors n
        twice = sumOfDivisors once

sumOfDivisors :: Integer -> Integer
sumOfDivisors = memoize $ sum . divisors

divisors :: Integer -> [Integer]
divisors n = filter evenDiv [1..(n `div` 2)]
  where evenDiv i = n `mod` i == 0