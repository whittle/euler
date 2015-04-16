{-# OPTIONS_GHC -XTemplateHaskell #-}

module Euler.Primes.Test (suite) where

import Data.List (nub, sort)
import Test.Tasty (TestTree)
import Test.Tasty.HUnit
import Test.Tasty.QuickCheck
import Test.Tasty.TH (testGroupGenerator)

import Euler.Primes

suite :: TestTree
suite = $(testGroupGenerator)

-- | https://oeis.org/A000040
a000040 :: [Integer]
a000040 = [ 2, 3, 5, 7, 11, 13, 17, 19, 23, 29
          , 31, 37, 41, 43, 47, 53, 59, 61, 67, 71
          , 73, 79, 83, 89, 97, 101, 103, 107, 109, 113
          , 127, 131, 137, 139, 149, 151, 157, 163, 167, 173
          , 179, 181, 191, 193, 197, 199, 211, 223, 227, 229
          , 233, 239, 241, 251, 257, 263, 269, 271
          ]

-- For the sake of speed, don’t do tests on integers over this limit
maxInput :: Integer
maxInput = 30000

inRange :: Integer -> Bool
inRange n = n > 0 && n < maxInput

case_first_58_primes :: Assertion
case_first_58_primes = a000040 @=? take 58 primes

case_factors_of_13195 :: Assertion
case_factors_of_13195 = [5, 7, 13, 29] @=? primeFactors (13195 :: Int)

prop_identify_prime_factors :: Integer -> Property
prop_identify_prime_factors n = inRange n ==> left n == n
  where left = product . primeFactors

case_factorization_of_120 :: Assertion
case_factorization_of_120 = [(5, 1), (3, 1), (2, 3)] @=? primeFactorization (120 :: Int)

prop_factorization :: Integer -> Property
prop_factorization n = inRange n ==> left n == n
  where left = product . map (uncurry (^)) . primeFactorization

prop_factors_match_factorization :: Integer -> Property
prop_factors_match_factorization n = inRange n ==> left n == right n
  where left = sort . nub . primeFactors
        right = sort . map fst . primeFactorization

case_proper_divisors_of_120 :: Assertion
case_proper_divisors_of_120 =
  [1, 2, 3, 4, 5, 6, 8, 10, 12, 15, 20, 24, 30, 40, 60] @=? (sort $ properDivisors (120 :: Int))

prop_sum_of_proper_divisors :: Integer -> Property
prop_sum_of_proper_divisors n = n > 1 && n < maxInput ==> left n == right n
  where left = sum . properDivisors
        right = sumOfProperDivisors

prop_is_prime :: Integer -> Property
prop_is_prime n = n > 1 && n <= last a000040 ==> elem n a000040 == isPrime n
