-- 2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.

-- What is the sum of the digits of the number 2^1000?

module Euler.Problem016
       ( solution
       ) where

solution :: Integer -> Integer
solution e = sum . digits $ 2^e

digits :: Integer -> [Integer]
digits = map (read . return) . show
