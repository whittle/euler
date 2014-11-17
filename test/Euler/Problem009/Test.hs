module Euler.Problem009.Test (suite) where

import Test.Tasty (testGroup, TestTree)
import Test.Tasty.HUnit

import Euler.Problem009

suite :: TestTree
suite = testGroup "Problem009"
                  [ testCase "sum to 12" test12
                  , testCase "2, 3, 4 is not a triplet" test234triplet
                  , testCase "3, 4, 5 is a triple" test345triplet
                  ]

test12 :: Assertion
test12 = 60 @=? solution 12

test234triplet :: Assertion
test234triplet = False @=? triplet 2 3 4

test345triplet :: Assertion
test345triplet = True @=? triplet 3 4 5
