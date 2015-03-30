module Euler.Problem020.Test (suite) where

import Control.Monad
import Data.Char (digitToInt)
import Test.Tasty (testGroup, TestTree)
import Test.Tasty.HUnit
import Test.Tasty.QuickCheck

import Euler.Problem020

suite :: TestTree
suite = testGroup "Problem020"
        [ testCase "for 10" test10
        , testProperty "sumOfDigits" prop_sumOfDigits
        ]

test10 :: Assertion
test10 = 27 @=? solution 10

prop_sumOfDigits :: Integer -> Property
prop_sumOfDigits n = n >= 0 ==> posterior n
  where posterior = liftM2 (==) sumOfDigits (toInteger . sum . map digitToInt . show)
