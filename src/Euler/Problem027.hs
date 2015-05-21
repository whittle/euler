-- Euler discovered the remarkable quadratic formula:

-- n² + n + 41

-- It turns out that the formula will produce 40 primes for the
-- consecutive values n = 0 to 39. However, when n = 40, 402 + 40 + 41
-- = 40(40 + 1) + 41 is divisible by 41, and certainly when n = 41,
-- 41² + 41 + 41 is clearly divisible by 41.

-- The incredible formula n² − 79n + 1601 was discovered, which
-- produces 80 primes for the consecutive values n = 0 to 79. The
-- product of the coefficients, −79 and 1601, is −126479.

-- Considering quadratics of the form:

-- n² + an + b, where |a| < 1000 and |b| < 1000

-- where |n| is the modulus/absolute value of n
-- e.g. |11| = 11 and |−4| = 4

-- Find the product of the coefficients, a and b, for the quadratic
-- expression that produces the maximum number of primes for
-- consecutive values of n, starting with n = 0.

module Euler.Problem027
       ( solution
       , countOfConsecutiveQuadPrimes
       ) where

import Control.Monad (liftM2)
import Data.Function.Memoize (memoize)
import Data.List (maximumBy)
import Data.Ord (comparing)

import qualified Math.Primes

solution :: Int -> Int
solution = uncurry (*) . maxByCountOfConsecutiveQuadPrimes

-- | When n == 0, f(n) == b, so b must be prime. When n == 1, f(n) ==
-- 1 + a + b, so a must be odd (unless b is 2, which we ignore).
maxByCountOfConsecutiveQuadPrimes :: Int -> (Int, Int)
maxByCountOfConsecutiveQuadPrimes n =
  maximumBy (comparing countOfConsecutiveQuadPrimes') $ do
    let n' = if n `mod` 2 == 0 then n - 1 else n - 2
    a <- (enumFromThenTo (-n') (-(n' - 2)) n')
    b <- tail $ takeWhile (< n) Math.Primes.primes
    return (a, b)

countOfConsecutiveQuadPrimes' :: (Int, Int) -> Int
countOfConsecutiveQuadPrimes' = memoize countOfConsecutiveQuadPrimes

countOfConsecutiveQuadPrimes :: (Int, Int) -> Int
countOfConsecutiveQuadPrimes (a, b) = head $ dropWhile (isGood . f) [0..]
  where isGood = liftM2 (&&) (> 1) isPrime
        f n = n * n + a * n + b

isPrime :: Int -> Bool
isPrime = memoize Math.Primes.isPrime
