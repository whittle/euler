-- The following iterative sequence is defined for the set of positive
-- integers:

-- n → n/2 (n is even)
-- n → 3n + 1 (n is odd)

-- Using the rule above and starting with 13, we generate the
-- following sequence: 13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1

-- It can be seen that this sequence (starting at 13 and finishing at
-- 1) contains 10 terms. Although it has not been proved yet (Collatz
-- Problem), it is thought that all starting numbers finish at 1.

-- Which starting number, under one million, produces the longest
-- chain?

-- NOTE: Once the chain starts the terms are allowed to go above one
-- million.

module Euler.Problem014
       ( solution
       , collatzSequenceLength
       ) where

import Data.List (maximumBy)
import Data.Ord (comparing)
import Data.Function.Memoize

-- https://wiki.haskell.org/Euler_problems/11_to_20#Problem_14

solution :: Int -> Int
solution = maximumBy (comparing collatzSequenceLength) . enumFromTo 1
--solution ceil = snd . maximum . map (\n -> (chainLength n, n)) $ [1..(ceil - 1)]

collatzSequenceLength :: Int -> Int
collatzSequenceLength = memoize collatzSequenceLength'

collatzSequenceLength' :: Int -> Int
collatzSequenceLength' 1 = 1
collatzSequenceLength' n = succ $ collatzSequenceLength $ step n

-- collatzSequenceLength' :: Int -> Int
-- collatzSequenceLength' = helper 1
--   where helper k 1 = k
--         helper k n = helper (succ k) $ step n

-- collatzSequenceLength' :: Int -> Int
-- collatzSequenceLength' = length . collatzSequenceFrom

-- collatzSequenceFrom :: Int -> [Int]
-- collatzSequenceFrom = memoize collatzSequenceFrom'

-- collatzSequenceFrom' :: Int -> [Int]
-- collatzSequenceFrom' 1 = [1]
-- collatzSequenceFrom' n = n : collatzSequenceFrom (step n)

-- chainLength :: Integer -> Integer
-- chainLength = memoize chainLength'

-- chainLength' :: Integer -> Integer
-- chainLength' 1 = 1
-- chainLength' n = (1 +) . chainLength . step $ n

step :: Int -> Int
step n | even n    = n `quot` 2
       | otherwise = 3 * n + 1
