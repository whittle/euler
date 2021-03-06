module Euler.Problem001Test (suite) where

import Test.Tasty (testGroup, TestTree)
import Test.Tasty.HUnit

import Euler.Problem001

suite :: TestTree
suite = testGroup "Problem001"
        [ testCase "with ceiling 10" test10
        ]

test10 :: Assertion
test10 = 23 @=? solution 10
