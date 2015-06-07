-- In England the currency is made up of pound, £, and pence, p, and
-- there are eight coins in general circulation:

-- 1p, 2p, 5p, 10p, 20p, 50p, £1 (100p) and £2 (200p).

-- It is possible to make £2 in the following way:

-- 1×£1 + 1×50p + 2×20p + 1×5p + 1×2p + 3×1p

-- How many different ways can £2 be made using any number of coins?

module Euler.Problem031
       ( solution
       ) where

solution :: Int -> Int
solution = flip countOfMultisetsBySum [200, 100, 50, 20, 10, 5, 2, 1]

-- Assumes that the second argument is in descending order and ends
-- with 1.
countOfMultisetsBySum :: Int -> [Int] -> Int
countOfMultisetsBySum _ [] = error "denominations exhausted"
countOfMultisetsBySum _ [1] = 1
countOfMultisetsBySum 0 _ = 1
countOfMultisetsBySum n xxs@(x:xs)
  | n >= x = countOfMultisetsBySum (n-x) xxs + countOfMultisetsBySum n xs
  | otherwise = countOfMultisetsBySum n xs
