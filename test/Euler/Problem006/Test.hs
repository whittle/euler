module Euler.Problem006.Test (suite) where

import Test.Tasty (testGroup, TestTree)
import Test.Tasty.HUnit

import Euler.Problem006

suite :: TestTree
suite = testGroup "Problem006"
                  [ testCase "with ceiling 10" test10
                  ]

test10 :: Assertion
test10 = 2640 @=? solution 10
