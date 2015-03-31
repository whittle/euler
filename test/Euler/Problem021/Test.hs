module Euler.Problem021.Test (suite) where

import Test.Tasty (testGroup, TestTree)
import Test.Tasty.HUnit

import Euler.Problem021

suite :: TestTree
suite = testGroup "Problem021"
        [ testCase "unamicability of 6" testUnamicability6
        , testCase "amicability of 220" testAmicability220
        , testCase "amicability of 284" testAmicability284
        ]

testUnamicability6 :: Assertion
testUnamicability6 = False @=? amicable 6

testAmicability220 :: Assertion
testAmicability220 = True @=? amicable 220

testAmicability284 :: Assertion
testAmicability284 = True @=? amicable 284
