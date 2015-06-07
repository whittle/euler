-- Surprisingly there are only three numbers that can be written as
-- the sum of fourth powers of their digits:

-- 1634 = 1^4 + 6^4 + 3^4 + 4^4
-- 8208 = 8^4 + 2^4 + 0^4 + 8^4
-- 9474 = 9^4 + 4^4 + 7^4 + 4^4
-- As 1 = 1^4 is not a sum it is not included.

-- The sum of these numbers is 1634 + 8208 + 9474 = 19316.

-- Find the sum of all the numbers that can be written as the sum of
-- fifth powers of their digits.

module Euler.Problem030
       ( solution
       , perfectDigitalInvariants
       , maxDigits
       , perfectDigitalInvariant
       , hasDigits
       ) where

import Data.List (delete)
import Data.Maybe (mapMaybe)
import Math.Combinatorics (combinationsWithRep)

solution :: Int -> Int
solution = sum . perfectDigitalInvariants

-- | Gives a list of PDIs for the power n.
perfectDigitalInvariants :: Int -> [Int]
perfectDigitalInvariants n = mapMaybe (perfectDigitalInvariant n) digitCombinations
  where digitCombinations = concatMap (flip combinationsWithRep [1..9]) [2..(maxDigits n)]

-- | A d-digit PDI of power n has a minimum value of 10^(d-1) and a
-- maximum value of d*9^n. Thus, the maximum number of digits for a
-- PDI of given power is the greatest d ∈ ℕ that satisfies the
-- inequality 10^(d-1) < d*9^n.
maxDigits :: Int -> Int
maxDigits n = last $ takeWhile ineq [2..]
  where ineq d = (10 ^ (d - 1)) < (d * 9 ^ n)

-- | If the given list of digits can be made into a PDI, Just that PDI
-- is returned, otherwise returns Nothing.
perfectDigitalInvariant :: Int -> [Int] -> Maybe Int
perfectDigitalInvariant n ds | x `hasDigits` ds = Just x
                             | otherwise = Nothing
  where x = sum $ map (^n) ds

-- | Checks to see if the non-zero digits of x (in base 10) are
-- exactly ds.
hasDigits :: Int -> [Int] -> Bool
hasDigits 0 [] = True
hasDigits _ [] = False
hasDigits 0 _ = False
hasDigits x ds | r == 0 = hasDigits q ds
               | r `elem` ds = hasDigits q $ delete r ds
               | otherwise = False
  where (q, r) = quotRem x 10
