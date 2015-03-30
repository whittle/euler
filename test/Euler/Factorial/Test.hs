module Euler.Factorial.Test (suite) where

import Test.Tasty (testGroup, TestTree)
import Test.Tasty.HUnit

import Euler.Factorial

suite :: TestTree
suite = testGroup "Factorial"
        [ testCase "first" testFirst
        , testCase "shortest" testShortest
        , testCase "fastest" testFastest
        ]

testFirst :: Assertion
testFirst = 3628800 @=? first 10

testShortest :: Assertion
testShortest = 3628800 @=? shortest 10

testFastest :: Assertion
testFastest = 3628800 @=? fastest 10
