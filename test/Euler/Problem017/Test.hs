module Euler.Problem017.Test (suite) where

import Test.Tasty (testGroup, TestTree)
import Test.Tasty.HUnit

import Euler.Problem017

suite :: TestTree
suite = testGroup "Problem017"
        [ testCase "for one to five" test5
        , testCase "spell 19" testSpell19
        , testCase "spell 20" testSpell20
        , testCase "spell 21" testSpell21
        , testCase "spell 115" testSpell115
        , testCase "spell 342" testSpell342
        , testCase "spell 1000" testSpell1000
        ]

test5 :: Assertion
test5 = 19 @=? solution 5

testSpell19 :: Assertion
testSpell19 = "nineteen" @=? spell 19

testSpell20 :: Assertion
testSpell20 = "twenty" @=? spell 20

testSpell21 :: Assertion
testSpell21 = "twenty-one" @=? spell 21

testSpell115 :: Assertion
testSpell115 = "one hundred and fifteen" @=? spell 115

testSpell342 :: Assertion
testSpell342 = "three hundred and forty-two" @=? spell 342

testSpell1000 :: Assertion
testSpell1000 = "one thousand" @=? spell 1000
