-- A collection of functions helpful for finding primes.

module Euler.Primes
       ( primes
       , primeFactors
       ) where

primes :: [Integer]
primes = 2 : filter (singleton . primeFactors) [3, 5 ..]
  where singleton (_:[]) = True
        singleton _ = False

primeFactors :: Integer -> [Integer]
primeFactors = factor primes
  where factor (p:ps) i
          | p * p > i      = [i]
          | i `mod` p == 0 = p : factor (p:ps) (i `div` p)
          | otherwise      = factor ps i
        factor [] _ = error "exhausted primes"
