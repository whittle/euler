module Euler.Problem008Test (suite) where

import Test.Tasty (testGroup, TestTree)
import Test.Tasty.HUnit

import Euler.Problem008

suite :: TestTree
suite = testGroup "Problem008"
                  [ testCase "length of 4" test4
                  ]

test4 :: Assertion
test4 = 5832 @=? solution 4
