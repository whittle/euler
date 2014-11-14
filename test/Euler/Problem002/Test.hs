module Euler.Problem002.Test (problem002Suite) where

import Test.Tasty (testGroup, TestTree)
import Test.Tasty.HUnit

import Euler.Problem002

problem002Suite :: TestTree
problem002Suite = testGroup "Problem002"
                  [ testCase "with ceiling 100" test100
                  , testCase "Fibonacci sequence" testFib
                  ]

test100 :: Assertion
test100 = 44 @=? solution 100

testFib :: Assertion
testFib = [1, 2, 3, 5, 8, 13, 21, 34, 55, 89] @=? takeWhile (< 100) fibSeq
