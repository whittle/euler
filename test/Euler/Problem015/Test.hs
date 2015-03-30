module Euler.Problem015.Test (suite) where

import Test.Tasty (testGroup, TestTree)
import Test.Tasty.HUnit

import Euler.Problem015

suite :: TestTree
suite = testGroup "Problem015"
        [ testCase "for a 2x2 grid" test2
        ]

test2 :: Assertion
test2 = 6 @=? solution 2
