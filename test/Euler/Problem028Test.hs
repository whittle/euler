{-# OPTIONS_GHC -XTemplateHaskell #-}

module Euler.Problem028Test (suite) where

import Test.Tasty (TestTree)
import Test.Tasty.HUnit
import Test.Tasty.TH (testGroupGenerator)

import Euler.Problem028

suite :: TestTree
suite = $(testGroupGenerator)

-- | http://oeis.org/A200975
a200975 :: Integral a => [a]
a200975 = [ 1, 3, 5, 7, 9, 13, 17, 21, 25, 31
          , 37, 43, 49, 57, 65, 73, 81, 91, 101, 111
          , 121, 133, 145, 157, 169, 183, 197, 211, 225, 241
          , 257, 273, 289, 307, 325, 343, 361, 381, 401, 421
          , 441, 463, 485, 507, 529, 553, 577, 601, 625, 651
          , 677, 703, 729, 757, 785, 813, 841, 871, 901
          ]

case_sum_of_ulams_spiral_diagonals_for_5_by_5 :: Assertion
case_sum_of_ulams_spiral_diagonals_for_5_by_5 =
  101 @=? solution (5 :: Int)

case_ulams_spiral_diagonals_for_29_by_29 :: Assertion
case_ulams_spiral_diagonals_for_29_by_29 =
  take 57 a200975 @=? ulamsSpiralDiagonalsFor (29 :: Int)
