module Euler.Problem012Test (suite) where

import Test.Tasty (testGroup, TestTree)
import Test.Tasty.HUnit
import Data.List (sort)

import Euler.Problem012

suite :: TestTree
suite = testGroup "Problem012"
        [ testCase "over 5 divisors" test5
        , testCase "divisors of 28" testDivisors
        , testCase "first 10 triangles" testTriangles
        ]

test5 :: Assertion
test5 = 28 @=? solution 5

testDivisors :: Assertion
testDivisors = [1, 2, 4, 7, 14, 28] @=? (sort $ divisors 28)

testTriangles :: Assertion
testTriangles = [1, 3, 6, 10, 15, 21, 28, 36, 45, 55] @=? take 10 triangles
