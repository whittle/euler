module Euler.Problem003.Test (suite) where

import Test.Tasty (testGroup, TestTree)
import Test.Tasty.HUnit

import Euler.Problem003

suite :: TestTree
suite = testGroup "Problem003"
                  [ testCase "with composite 13195" test13195
                  , testCase "factors of 13195" testFactors
                  ]

test13195 :: Assertion
test13195 = 29 @=? solution 13195

testFactors :: Assertion
testFactors = [5, 7, 13, 29] @=? primeFactors 13195
