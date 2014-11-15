module Euler.Problem007.Test (suite) where

import Test.Tasty (testGroup, TestTree)
import Test.Tasty.HUnit

import Euler.Problem007

suite :: TestTree
suite = testGroup "Problem007"
                  [ testCase "number 6" test6
                  ]

test6 :: Assertion
test6 = 13 @=? solution 6
