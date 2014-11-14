-- A palindromic number reads the same both ways. The largest
-- palindrome made from the product of two 2-digit numbers is 9009 =
-- 91 × 99.

-- Find the largest palindrome made from the product of two 3-digit numbers.

module Euler.Problem004
       ( solution
       , palindrome
       ) where

solution :: Integer -> Integer
solution = head . filter palindrome . desortedProductsFrom

palindrome :: Integer -> Bool
palindrome i = s == reverse s
  where s = show i

desortedProductsFrom :: Integer -> [Integer]
desortedProductsFrom ceil = foldr merge' [] [map (* i) (ceil `downto` i) | i <- ceil `downto` 1]

-- Adapted from https://www.haskell.org/pipermail/haskell-cafe/2009-April/060034.html
merge' :: Ord a => [a] -> [a] -> [a]
merge' (x:xs) ys = x : merge xs ys
merge' [] ys = ys

merge :: Ord a => [a] -> [a] -> [a]
merge xs@(x:xt) ys@(y:yt)
  | x > y = x : merge xt ys
  | otherwise = y : merge xs yt
merge xs ys = xs ++ ys

downto :: Integer -> Integer -> [Integer]
downto ceil = enumFromThenTo (ceil - 1) (ceil - 2)
