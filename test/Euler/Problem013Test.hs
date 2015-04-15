module Euler.Problem013Test (suite) where

import Test.Tasty (testGroup, TestTree)
import Test.Tasty.HUnit

import Euler.Problem013

suite :: TestTree
suite = testGroup "Problem013"
        [ testCase "count of addends" testAddends
        ]

testAddends :: Assertion
testAddends = 100 @=? length addends
