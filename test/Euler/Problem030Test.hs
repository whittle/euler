{-# OPTIONS_GHC -XTemplateHaskell #-}

module Euler.Problem030Test (suite) where

import Data.List (sort)
import Test.Tasty (TestTree)
import Test.Tasty.HUnit
import Test.Tasty.TH (testGroupGenerator)

import Euler.Problem030

suite :: TestTree
suite = $(testGroupGenerator)

case_identify_quartic_pdis :: Assertion
case_identify_quartic_pdis = do
  Just 1634 @=? perfectDigitalInvariant 4 [1, 3, 4, 6]
  Just 8208 @=? perfectDigitalInvariant 4 [2, 8, 8]
  Just 9474 @=? perfectDigitalInvariant 4 [4, 4, 7, 9]

case_max_digits_for_n_4 :: Assertion
case_max_digits_for_n_4 = 5 @=? maxDigits 4

case_quartic_perfect_digital_invariants :: Assertion
case_quartic_perfect_digital_invariants = [1634, 8208, 9474] @=? sort (perfectDigitalInvariants 4)

case_solution_for_fourth_powers :: Assertion
case_solution_for_fourth_powers = 19316 @=? solution 4
