module Euler.Problem019.Test (suite) where

import Control.Monad (ap)
import Data.Time.Calendar as Cal
import Data.Time.Calendar.WeekDate as Week
import Test.Tasty (testGroup, TestTree)
import Test.Tasty.QuickCheck

import Euler.Problem019

suite :: TestTree
suite = testGroup "Problem019"
        [ testProperty "calculate modified Julian day" prop_modifiedJulian
        , testProperty "positively identify Sundays" prop_sundayPositive
        , testProperty "negatively identify non-Sundays" prop_sundayNegative
        ]

prop_modifiedJulian :: Integer -> Bool
prop_modifiedJulian = ap (==) (modifiedJulian . Cal.toGregorian . Cal.ModifiedJulianDay)

prop_sundayPositive :: Integer -> Int -> Bool
prop_sundayPositive y w = isSunday . Cal.toGregorian $ Week.fromWeekDate y w 7

prop_sundayNegative :: Integer -> Int -> Int -> Property
prop_sundayNegative y w d = prior ==> posterior
  where prior = d < 7
        posterior = not . isSunday . Cal.toGregorian $ Week.fromWeekDate y w d
