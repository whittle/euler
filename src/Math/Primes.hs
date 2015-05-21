-- A collection of functions helpful for finding primes.

module Math.Primes
       ( primes
       , isPrime
       , primeFactors
       , primeFactorization
       , properDivisors
       , sumOfProperDivisors
       ) where

import Data.List (delete, nub, subsequences)

primes :: Integral a => [a]
primes = 2 : filter isPrime [3, 5 ..]

isPrime :: Integral a => a -> Bool
isPrime = null . tail . primeFactors

primeFactors :: Integral a => a -> [a]
primeFactors = factor primes
  where factor (p:ps) i
          | p * p > i      = [i]
          | i `mod` p == 0 = p : factor (p:ps) (i `div` p)
          | otherwise      = factor ps i
        factor [] _ = error "exhausted primes"

primeFactorization :: Integral a => a -> [(a, a)]
primeFactorization = factorize primes []
  where factorize (p:ps) m i
          | p * p > i      = incr i m
          | i `mod` p == 0 = factorize (p:ps) (incr p m) (i `div` p)
          | otherwise      = factorize ps m i
        factorize [] _ _ = error "exhausted primes"
        incr k ((f, e):fs) = if k == f then (f, e + 1) : fs else (k, 1) : (f, e) : fs
        incr k [] = [(k, 1)]

-- This is unnecessarily slow, but right now I’m just using it to test
-- sumOfProperDivisors against.
properDivisors :: Integral a => a -> [a]
properDivisors = nub . map product . properSubsequences . primeFactors
  where properSubsequences l = delete l $ subsequences l

sumOfProperDivisors :: Integral a => a -> a
sumOfProperDivisors n
  | n < 2     = 0
  | otherwise = sumOfDivisors n - n

-- http://math.stackexchange.com/questions/22721/is-there-a-formula-to-calculate-the-sum-of-all-proper-divisors-of-a-number
-- http://planetmath.org/formulaforsumofdivisors
sumOfDivisors :: Integral a => a -> a
sumOfDivisors = product . map f . primeFactorization
  where f (p, a) = (p ^ (a + 1) - 1) `div` (p - 1)
