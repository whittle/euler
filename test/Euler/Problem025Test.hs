{-# OPTIONS_GHC -XTemplateHaskell #-}

module Euler.Problem025Test (suite) where

import Test.Tasty (TestTree)
import Test.Tasty.HUnit
import Test.Tasty.TH (testGroupGenerator)

import Euler.Problem025

suite :: TestTree
suite = $(testGroupGenerator)

fibSeq :: [Integer]
fibSeq = [0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144]

case_first_13_fibonacci_numbers :: Assertion
case_first_13_fibonacci_numbers = fibSeq @=? take 13 fibonaccis

case_first_3_digit_fibonacci_number :: Assertion
case_first_3_digit_fibonacci_number = 12 @=? solution 3
