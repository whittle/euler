module Euler.Primes.Test (suite) where

import Data.List (nub, sort)
import Test.Tasty (testGroup, TestTree)
import Test.Tasty.HUnit
import Test.Tasty.QuickCheck

import Euler.Primes

suite :: TestTree
suite = testGroup "Primes"
                  [ testCase "first ten primes" test10primes
                  , testCase "when factoring 13195" test13195factors
                  , testProperty "prime factors" prop_factors
                  , testCase "factorization of 120" test120factorization
                  , testProperty "factorization" prop_factorization
                  , testProperty "factors vs factorization" prop_factorsVsFactorization
                  , testCase "proper divisors of 120" testProperDivisors120
                  , testProperty "sum of proper divisors" prop_sumOfProperDivisors
                  ]

-- For the sake of speed, don’t do tests on integers over this limit
maxInput :: Integer
maxInput = 30000

inRange :: Integer -> Bool
inRange n = n > 0 && n < maxInput

test10primes :: Assertion
test10primes = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29] @=? take 10 primes

test13195factors :: Assertion
test13195factors = [5, 7, 13, 29] @=? primeFactors 13195

prop_factors :: Integer -> Property
prop_factors n = inRange n ==> left n == n
  where left = product . primeFactors

test120factorization :: Assertion
test120factorization = [(5, 1), (3, 1), (2, 3)] @=? primeFactorization 120

prop_factorization :: Integer -> Property
prop_factorization n = inRange n ==> left n == n
  where left = product . map (uncurry (^)) . primeFactorization

prop_factorsVsFactorization :: Integer -> Property
prop_factorsVsFactorization n = inRange n ==> left n == right n
  where left = sort . nub . primeFactors
        right = sort . map fst . primeFactorization

testProperDivisors120 :: Assertion
testProperDivisors120 = [1, 2, 3, 4, 5, 6, 8, 10, 12, 15, 20, 24, 30, 40, 60] @=? (sort $ properDivisors 120)

prop_sumOfProperDivisors :: Integer -> Property
prop_sumOfProperDivisors n = n > 1 && n < maxInput ==> left n == right n
  where left = sum . properDivisors
        right = sumOfProperDivisors
