{-# OPTIONS_GHC -XTemplateHaskell #-}

module Euler.Problem031Test (suite) where

import Test.Tasty (TestTree)
import Test.Tasty.HUnit
import Test.Tasty.TH (testGroupGenerator)

import Euler.Problem031

suite :: TestTree
suite = $(testGroupGenerator)

case_combinations_making_1p :: Assertion
case_combinations_making_1p = 1 @=? solution 1

case_combinations_making_2p :: Assertion
case_combinations_making_2p = 2 @=? solution 2

case_combinations_making_5p :: Assertion
case_combinations_making_5p = 4 @=? solution 5
