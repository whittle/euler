{-# OPTIONS_GHC -XTemplateHaskell #-}

module Math.CombinatoricsTest (suite) where

import Test.Tasty (TestTree)
import Test.Tasty.HUnit
import Test.Tasty.TH (testGroupGenerator)

import Math.Combinatorics

suite :: TestTree
suite = $(testGroupGenerator)

case_combinations_of_2_out_of_3_with_repetition :: Assertion
case_combinations_of_2_out_of_3_with_repetition =
  [[1, 1], [1, 2], [1, 3], [2, 2], [2, 3], [3, 3]] @=? combinationsWithRep 2 [(1 :: Int), 2, 3]
