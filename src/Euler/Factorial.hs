-- A collection of factorial-finding algorithms.

module Euler.Factorial
       ( factorial
       , simplest
       ) where

factorial :: Integer -> Integer
factorial = simplest

simplest :: Integer -> Integer
simplest 1 = 1
simplest n = n * simplest (n - 1)
