module Euler.Problem022Test (suite) where

import Test.Tasty (testGroup, TestTree)
import Test.Tasty.HUnit

import Euler.Problem022

suite :: TestTree
suite = testGroup "Problem022"
        [ testCase "alphabetical value of COLIN" testValueColin
        , testCase "input reader" testInputReader
        ]

testValueColin :: Assertion
testValueColin = 53 @=? alphabeticalValue "COLIN"

testInputReader :: Assertion
testInputReader = ["MARY","PATRICIA","LINDA"] @=? inputReader "\"MARY\",\"PATRICIA\",\"LINDA\""
