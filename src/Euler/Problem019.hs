-- You are given the following information, but you may prefer to do
-- some research for yourself.

--    1 Jan 1900 was a Monday.

--    Thirty days has September,
--    April, June and November.
--    All the rest have thirty-one,
--    Saving February alone,
--    Which has twenty-eight, rain or shine.
--    And on leap years, twenty-nine.

--    A leap year occurs on any year evenly divisible by 4, but not on
--    a century unless it is divisible by 400.

-- How many Sundays fell on the first of the month during the
-- twentieth century (1 Jan 1901 to 31 Dec 2000)?

module Euler.Problem019
       ( solution
       , modifiedJulian
       , isSunday
       ) where

import Data.Ix (range)

type Day = (Integer, Int, Int)

solution :: Day -> Day -> Int
solution s e = length . filter isSunday $ firstsBetween s e

firstsBetween :: Day -> Day -> [Day]
firstsBetween (sy, sm, sd) (ey, em, _) = do
  y <- range (sy, ey)
  let sm' = if sd == 1 then sm else sm + 1
  m <- range (sm', em)
  return (y, m, 1)

isSunday :: Day -> Bool
isSunday = (== 0) . (`mod` 7) . (`subtract` firstSunday) . modifiedJulian
  where firstSunday = -678933

-- Stolen from http://alcor.concordia.ca/~gpkatch/gdate-algorithm.html
modifiedJulian :: Day -> Integer
modifiedJulian (y, m, d) =
  let m' = toInteger ((m + 9) `mod` 12)
      y' = y - (m' `div` 10)
      d' = toInteger d
      epoch = 678881
  in 365 * y'
     + y' `div` 4
     - y' `div` 100
     + y' `div` 400
     + (m' * 306 + 5) `div` 10
     + d' - 1 - epoch
