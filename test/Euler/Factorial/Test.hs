module Euler.Factorial.Test (suite) where

import Test.Tasty (testGroup, TestTree)
import Test.Tasty.HUnit

import Euler.Factorial

suite :: TestTree
suite = testGroup "Factorial"
        [ testCase "of 10" test10
        ]

test10 :: Assertion
test10 = 3628800 @=? simplest 10
