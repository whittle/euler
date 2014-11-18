module Euler.Primes.Test (suite) where

import Test.Tasty (testGroup, TestTree)
import Test.Tasty.HUnit

import Euler.Primes

suite :: TestTree
suite = testGroup "Primes"
                  [ testCase "first ten primes" test10primes
                  , testCase "when factoring 13195" test13195factors
                  ]

test10primes :: Assertion
test10primes = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29] @=? take 10 primes

test13195factors :: Assertion
test13195factors = [5, 7, 13, 29] @=? primeFactors 13195
