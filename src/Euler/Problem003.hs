-- The prime factors of 13195 are 5, 7, 13 and 29.

-- What is the largest prime factor of the number 600851475143 ?

module Euler.Problem003
       ( solution
       , primeFactors
       ) where

solution :: Integer -> Integer
solution = last . primeFactors

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
