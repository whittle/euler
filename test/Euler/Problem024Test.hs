{-# OPTIONS_GHC -XTemplateHaskell #-}

module Euler.Problem024Test (suite) where

import Data.List (permutations, sort)
import Test.Tasty (TestTree)
import Test.Tasty.QuickCheck
import Test.Tasty.TH (testGroupGenerator)

import Euler.Problem024

suite :: TestTree
suite = $(testGroupGenerator)

prop_permutation_count_of_arbitrary_list :: [Int] -> Property
prop_permutation_count_of_arbitrary_list ns = length ns < 10 ==> expected == actual
  where expected = length $ permutations ns
        actual = permutationCount ns

prop_nth_lexicographic_permutation_of_01234 :: Int -> Property
prop_nth_lexicographic_permutation_of_01234 n = n > 0 && n <= 120 ==> expected == actual
  where expected = (sort $ permutations "01234") !! pred n
        actual = nthLexicographicPermutation n "01234"
