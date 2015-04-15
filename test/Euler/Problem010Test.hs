module Euler.Problem010Test (suite) where

import Test.Tasty (testGroup, TestTree)
import Test.Tasty.HUnit

import Euler.Problem010

suite :: TestTree
suite = testGroup "Problem010"
                  [ testCase "ceiling of 10" test10
                  ]

test10 :: Assertion
test10 = 17 @=? solution 10
