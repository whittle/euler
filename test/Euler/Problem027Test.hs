{-# OPTIONS_GHC -XTemplateHaskell #-}

module Euler.Problem027Test (suite) where

import Test.Tasty (TestTree)
import Test.Tasty.HUnit
import Test.Tasty.TH (testGroupGenerator)

import Euler.Problem027

suite :: TestTree
suite = $(testGroupGenerator)

case_count_of_consecutive_quad_primes_for_a_of_1_b_of_41 :: Assertion
case_count_of_consecutive_quad_primes_for_a_of_1_b_of_41 =
  40 @=? countOfConsecutiveQuadPrimes (1, 41)
