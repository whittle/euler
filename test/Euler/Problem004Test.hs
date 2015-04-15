module Euler.Problem004Test (suite) where

import Test.Tasty (testGroup, TestTree)
import Test.Tasty.HUnit

import Euler.Problem004

suite :: TestTree
suite = testGroup "Problem004"
                  [ testCase "with ceiling 100" test100
                  , testCase "9009 is a palindrome" test9009pal
                  , testCase "9000 isn't a palindrome" test9000pal
                  ]

test100 :: Assertion
test100 = 9009 @=? solution 100

test9009pal :: Assertion
test9009pal = True @=? palindrome 9009

test9000pal :: Assertion
test9000pal = False @=? palindrome 9000
