{-# OPTIONS_GHC -XTemplateHaskell #-}

module Euler.Problem014Test (suite) where

import Test.Tasty (TestTree)
import Test.Tasty.HUnit
import Test.Tasty.QuickCheck
import Test.Tasty.TH (testGroupGenerator)

import Euler.Problem014

suite :: TestTree
suite = $(testGroupGenerator)

-- | http://oeis.org/A008908
a008908 :: Integral a => [a]
a008908 = [ 1, 2, 8, 3, 6, 9, 17, 4, 20, 7
          , 15, 10, 10, 18, 18, 5, 13, 21, 21, 8
          , 8, 16, 16, 11, 24, 11, 112, 19, 19, 19
          , 107, 6, 27, 14, 14, 22, 22, 22, 35, 9
          , 110, 9, 30, 17, 17, 17, 105, 12, 25, 25
          , 25, 12, 12, 113, 113, 20, 33, 20, 33, 20
          , 20, 108, 108, 7, 28, 28, 28, 15, 15, 15
          , 103
          ]

case_longest_collatz_sequence_in_first_71 :: Assertion
case_longest_collatz_sequence_in_first_71 =
  55 @=? solution 71

prop_collatz_sequence_length :: Int -> Property
prop_collatz_sequence_length n =
  n > 0 && n <= 71 ==> a008908 !! (pred n) == collatzSequenceLength (fromIntegral n)
