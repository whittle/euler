-- The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

-- Find the sum of all the primes below two million.

module Euler.Problem010
       ( solution
       ) where

import Euler.Primes (primes)

solution :: Integer -> Integer
solution ceil = sum $ takeWhile (<ceil) primes
