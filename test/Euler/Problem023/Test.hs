{-# OPTIONS_GHC -XTemplateHaskell #-}

module Euler.Problem023.Test (suite) where

import Test.Tasty
import Test.Tasty.HUnit
import Test.Tasty.QuickCheck
import Test.Tasty.TH

import Euler.Problem023

suite :: TestTree
suite = $(testGroupGenerator)

case_abundanceOf12 :: Assertion
case_abundanceOf12 = True @=? abundant 12

-- from https://oeis.org/A005101
first20Abundants :: [Integer]
first20Abundants = [ 12, 18, 20, 24, 30, 36, 40, 42, 48, 54
                   , 56, 60, 66, 70, 72, 78, 80, 84, 88, 90
                   ]

case_first20Abundants :: Assertion
case_first20Abundants = first20Abundants @=? take 20 abundants

leastSumsOfAbundants :: [Integer]
leastSumsOfAbundants = [ 24, 30, 32, 36, 38, 40, 42, 44, 48, 50
                       , 52, 54, 56, 58, 60, 62, 64, 66, 68, 70
                       , 72, 74, 76, 78, 80, 82, 84, 86, 88, 90
                       , 92, 94, 96, 98, 100
                       ]

prop_sumOfAbundants :: Integer -> Property
prop_sumOfAbundants n = prior ==> posterior
  where prior = n > 0 && n <= 100
        posterior = elem n leastSumsOfAbundants == sumOfAbundants n
