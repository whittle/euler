{-# OPTIONS_GHC -XTemplateHaskell #-}

module Euler.Problem011Test (suite) where

import Numeric.LinearAlgebra.Data (Matrix, loadMatrix)
import Test.Tasty (TestTree)
import Test.Tasty.HUnit
import Test.Tasty.TH (testGroupGenerator)

import Euler.Problem011

suite :: TestTree
suite = $(testGroupGenerator)

matrix :: IO (Matrix Double)
matrix = loadMatrix "input/011.txt"

case_count_of_vectors_in_input :: Assertion
case_count_of_vectors_in_input =
  matrix >>= \m -> 10 @=? (length . vectors . head $ submatrices 4 m)

case_count_of_4x4_submatrices_in_input :: Assertion
case_count_of_4x4_submatrices_in_input =
  matrix >>= \m -> 17 * 17 @=? (length $ submatrices 4 m)
