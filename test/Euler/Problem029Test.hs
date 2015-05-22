{-# OPTIONS_GHC -XTemplateHaskell #-}

module Euler.Problem029Test (suite) where

import Test.Tasty (TestTree)
import Test.Tasty.HUnit
import Test.Tasty.QuickCheck
import Test.Tasty.TH (testGroupGenerator)

import Math.Primes as P
import Euler.Problem029

suite :: TestTree
suite = $(testGroupGenerator)

-- For the sake of speed, don’t factor integers over this limit
maxInput :: Integer
maxInput = 30000

inRange :: Integer -> Bool
inRange n = n > 0 && n < maxInput

prop_exponentiation_of_a_factorization_is_correct :: Integer -> Integer -> Property
prop_exponentiation_of_a_factorization_is_correct n m = inRange n && m > 0 ==> n ^ m == f n
  where f = product . map (uncurry (^)) . expFact m . P.primeFactorization

case_solution_up_to_five :: Assertion
case_solution_up_to_five = 15 @=? solution (5 :: Int)
