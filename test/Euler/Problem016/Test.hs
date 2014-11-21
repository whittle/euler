module Euler.Problem016.Test (suite) where

import Test.Tasty (testGroup, TestTree)
import Test.Tasty.HUnit

import Euler.Problem016

suite :: TestTree
suite = testGroup "Problem016"
        [ testCase "for an exponent of 15" test15
        ]

test15 :: Assertion
test15 = 26 @=? solution 15
