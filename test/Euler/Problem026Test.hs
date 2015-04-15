{-# OPTIONS_GHC -XTemplateHaskell #-}

module Euler.Problem026Test (suite) where

import Test.Tasty (TestTree)
import Test.Tasty.HUnit
import Test.Tasty.QuickCheck
import Test.Tasty.TH (testGroupGenerator)

import Euler.Problem026

suite :: TestTree
suite = $(testGroupGenerator)

-- http://oeis.org/A051626
repetendLengths :: [Int]
repetendLengths = [ 0, 0, 1, 0, 0, 1, 6, 0, 1, 0, 2, 1, 6, 6, 1, 0, 16, 1, 18, 0
                  , 6, 2, 22, 1, 0, 6, 3, 6, 28, 1, 15, 0, 2, 16, 6, 1, 3, 18, 6, 0
                  , 5, 6, 21, 2, 1, 22, 46, 1, 42, 0, 16, 6, 13, 3, 2, 6, 18, 28, 58, 1
                  , 60, 15, 6, 0, 6, 2, 33, 16, 22, 6, 35, 1, 8, 3, 1, 18, 6, 6, 13, 0
                  , 9, 5, 41, 6, 16, 21, 28, 2, 44, 1
                  ]

case_longest_repetend_of_a_unit_fraction_under_90 :: Assertion
case_longest_repetend_of_a_unit_fraction_under_90 =
  61 @=? solution (90 :: Int)

prop_repetend_length_of_unit_fraction :: Int -> Property
prop_repetend_length_of_unit_fraction n =
  n > 0 && n <= 90 ==> repetendLengths !! (n - 1) == repetendLengthOfUnitFraction n

case_quot_rems_of_a_unit_fraction :: Assertion
case_quot_rems_of_a_unit_fraction =
  take 10 (repeat (3, 1)) @=? take 10 (quotRems (3 :: Int))
