module Euler.Problem005Test (suite) where

import Test.Tasty (testGroup, TestTree)
import Test.Tasty.HUnit

import Euler.Problem005

suite :: TestTree
suite = testGroup "Problem005"
                  [ testCase "with ceiling 10" test10
                  ]

test10 :: Assertion
test10 = 2520 @=? solution 10
