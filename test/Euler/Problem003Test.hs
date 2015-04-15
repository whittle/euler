module Euler.Problem003Test (suite) where

import Test.Tasty (testGroup, TestTree)
import Test.Tasty.HUnit

import Euler.Problem003

suite :: TestTree
suite = testGroup "Problem003"
                  [ testCase "with composite 13195" test13195
                  ]

test13195 :: Assertion
test13195 = 29 @=? solution 13195
