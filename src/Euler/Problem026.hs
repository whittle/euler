-- A unit fraction contains 1 in the numerator. The decimal
-- representation of the unit fractions with denominators 2 to 10 are
-- given:

-- 1/2 = 0.5
-- 1/3 = 0.(3)
-- 1/4 = 0.25
-- 1/5 = 0.2
-- 1/6 = 0.1(6)
-- 1/7 = 0.(142857)
-- 1/8 = 0.125
-- 1/9 = 0.(1)
-- 1/10 = 0.1

-- Where 0.1(6) means 0.166666..., and has a 1-digit recurring
-- cycle. It can be seen that 1/7 has a 6-digit recurring cycle.

-- Find the value of d < 1000 for which 1/d contains the longest
-- recurring cycle in its decimal fraction part.

module Euler.Problem026
       ( solution
       , repetendLengthOfUnitFraction
       , quotRems
       ) where

import Control.Monad (ap)
import Data.List (maximumBy)
import Data.Ord (comparing)

-- This solution could be optimized: the longest possible repetend of
-- the unit fraction 1/n has length n - 1. That means we could search
-- from the top of the space and stop after considering any divisor
-- less than the greatest repetend found.

solution :: Integral a => a -> a
solution = fst . maximumBy (comparing snd) . map repetendPair . enumFromTo 2
  where repetendPair = ap (,) repetendLengthOfUnitFraction

-- | Cycle detection performed on the digits of the quotient of a unit
-- fraction.
repetendLengthOfUnitFraction :: Integral a => a -> Int
repetendLengthOfUnitFraction = cycleLength 0 . map snd . quotRems

-- | From a list, perform tortoise-and-hare style cycle detection
-- (http://en.wikipedia.org/wiki/Cycle_detection) with one
-- modification. The modification is that if any element is detected
-- which matches a specially-identified value z, the cycle is
-- determined to have length 0. The input list is assumed to be
-- infinite.
cycleLength :: Eq a => a -> [a] -> Int
cycleLength z rs = firstCycleLength $ lengthMultipleOver 1
  where lengthMultipleOver :: Int -> Int
        lengthMultipleOver i
          | rs !! t == z = 0
          | rs !! h == z = 0
          | rs !! t == rs !! h = i
          | otherwise = lengthMultipleOver $ succ i
          where t = i - 1 -- tortoise, adjusted to zero-based list
                h = 2 * i - 1 -- hare, adjusted to zero-based list
        firstCycleLength :: Int -> Int
        firstCycleLength 0 = 0
        firstCycleLength m = matchOver 1 $ dropNonCycle rs
          where dropNonCycle :: Eq a => [a] -> [a]
                dropNonCycle [] = error "exhausted list looking for beginning of cycle"
                dropNonCycle ns@(n:_)
                  | n == ns !! m = ns
                  | otherwise = dropNonCycle $ tail ns
                matchOver :: Eq a => Int -> [a] -> Int
                matchOver _ [] = error "exhausted list looking for end of cycle"
                matchOver i ns@(n:_)
                  | n == ns !! i = i
                  | otherwise = matchOver (succ i) ns

-- | An infinite list that represents the result of continued long
-- division of the unit fraction 1/n. Each pair is composed of one
-- digit of the quotient and the remainder of the division after that
-- digit. Starts at the tenth’s place, skipping the initial “0.”
quotRems :: Integral a => a -> [(a, a)]
quotRems n = at 10
  where at r = let p = quotRem r n
               in p : at (10 * snd p)
