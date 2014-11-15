-- By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we
-- can see that the 6th prime is 13.

-- What is the 10 001st prime number?

module Euler.Problem007
       ( solution
       ) where

import Data.List (genericIndex)

solution :: Integer -> Integer
solution = genericIndex primes . pred

primeFactors :: Integer -> [Integer]
primeFactors = factor primes
  where factor (p:ps) i
          | p * p > i      = [i]
          | i `mod` p == 0 = p : factor (p:ps) (i `div` p)
          | otherwise      = factor ps i
        factor [] _ = error "exhausted primes"

primes :: [Integer]
primes = 2 : filter (singleton . primeFactors) [3, 5 ..]
  where singleton (_:[]) = True
        singleton _ = False
