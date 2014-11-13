module Euler.Problem001.Test (problem001Suite) where

import Test.Tasty (testGroup, TestTree)
import Test.Tasty.HUnit

import Euler.Problem001

problem001Suite :: TestTree
problem001Suite = testGroup "Problem001"
                  [ testCase "with ceiling 10" test10
                  ]

test10 :: Assertion
test10 = 23 @=? solution 10
