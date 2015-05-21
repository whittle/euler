-- A perfect number is a number for which the sum of its proper
-- divisors is exactly equal to the number. For example, the sum of
-- the proper divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which
-- means that 28 is a perfect number.

-- A number n is called deficient if the sum of its proper divisors is
-- less than n and it is called abundant if this sum exceeds n.

-- As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the
-- smallest number that can be written as the sum of two abundant
-- numbers is 24. By mathematical analysis, it can be shown that all
-- integers greater than 28123 can be written as the sum of two
-- abundant numbers. However, this upper limit cannot be reduced any
-- further by analysis even though it is known that the greatest
-- number that cannot be expressed as the sum of two abundant numbers
-- is less than this limit.

-- Find the sum of all the positive integers which cannot be written
-- as the sum of two abundant numbers.

module Euler.Problem023
       ( solution
       , sumOfAbundants
       , abundants
       , abundant
       ) where

import Control.Monad
import Data.Function.Memoize

import Math.Primes

solution :: Integer -> Integer
solution n = sum $ filter (not . sumOfAbundants) [1..n]

sumOfAbundants :: Integer -> Bool
sumOfAbundants n = f abundants
  where f (a:as) = if a * 2 > n then False else abundant (n - a) || f as
        f [] = error "exhausted abundants"

abundants :: [Integer]
abundants = filter abundant [2..]

abundant :: Integer -> Bool
abundant = memoize $ ap (<) sumOfProperDivisors
