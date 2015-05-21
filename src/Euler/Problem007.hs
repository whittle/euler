-- By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we
-- can see that the 6th prime is 13.

-- What is the 10 001st prime number?

module Euler.Problem007
       ( solution
       ) where

import Data.List (genericIndex)
import Math.Primes

solution :: Integer -> Integer
solution = genericIndex primes . pred
