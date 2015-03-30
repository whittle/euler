-- A collection of factorial-finding algorithms.

module Euler.Factorial
       ( factorial
       , first
       , shortest
       , fastest
       ) where

factorial :: Integer -> Integer
factorial = fastest

first :: Integer -> Integer
first 1 = 1
first n = n * first (n - 1)

shortest :: Integer -> Integer
shortest n = product [1..n]

-- Stolen from http://www.serpentine.com/blog/2007/04/23/efficiently-computing-a-factorial-using-binary-splitting/
fastest :: Integer -> Integer
fastest n = split n 0
  where split a b = let d = a - b
                    in if d < 0
                       then 0
                       else case d of
                             0 -> 1
                             1 -> a
                             2 -> a * (a - 1)
                             3 -> a * (a - 1) * (a - 2)
                             _ -> let m = (a + b) `div` 2
                                  in split a m * split m b
