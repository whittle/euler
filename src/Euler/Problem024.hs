-- A permutation is an ordered arrangement of objects. For example,
-- 3124 is one possible permutation of the digits 1, 2, 3 and 4. If
-- all of the permutations are listed numerically or alphabetically,
-- we call it lexicographic order. The lexicographic permutations of
-- 0, 1 and 2 are:

-- 012   021   102   120   201   210

-- What is the millionth lexicographic permutation of the digits 0, 1,
-- 2, 3, 4, 5, 6, 7, 8 and 9?

module Euler.Problem024
       ( solution
       , nthLexicographicPermutation
       , permutationCount
       ) where

import Data.List (delete, sort)

import Euler.Factorial (factorial)

solution :: Int -> Int
solution n = read $ nthLexicographicPermutation n "0123456789"

nthLexicographicPermutation :: Ord a => Int -> [a] -> [a]
nthLexicographicPermutation i as
  | i < 1 = error "index out of range"
  | (i - 1) > permutationCount as = error "index out of range"
  | otherwise = lexPerm (i - 1) (sort as)

-- The private version of nthLexicographicPermutation. Assumes that
-- the list is sorted, that the index is 0-based, and that there exist
-- sufficient permutations of the list to satisfy the index.
lexPerm :: Ord a => Int -> [a] -> [a]
lexPerm 0 as = as
lexPerm _ [] = error "permutations exhausted"
lexPerm i as = a : lexPerm (i - k * step) (delete a as)
  where a = as !! k
        k = i `div` step
        step = permutationCount $ tail as

permutationCount :: [a] -> Int
permutationCount = factorial . length
