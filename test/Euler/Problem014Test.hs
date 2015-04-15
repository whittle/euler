module Euler.Problem014Test (suite) where

import Test.Tasty (testGroup, TestTree)
import Test.Tasty.HUnit

import Euler.Problem014

suite :: TestTree
suite = testGroup "Problem014"
        [ testCase "with a ceiling of 14" test14
        , testCase "length of chain starting at 13" test13chain
        , testCase "when stepping from 13" test13step
        , testCase "when stepping from 40" test40step
        ]

test14 :: Assertion
test14 = 9 @=? solution 12

test13chain :: Assertion
test13chain = 10 @=? chainLength 13

test13step :: Assertion
test13step = 40 @=? step 13

test40step :: Assertion
test40step = 20 @=? step 40
