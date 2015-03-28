-- If the numbers 1 to 5 are written out in words: one, two, three,
-- four, five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in
-- total.

-- If all the numbers from 1 to 1000 (one thousand) inclusive were
-- written out in words, how many letters would be used?

-- NOTE: Do not count spaces or hyphens. For example, 342 (three
-- hundred and forty-two) contains 23 letters and 115 (one hundred and
-- fifteen) contains 20 letters. The use of "and" when writing out
-- numbers is in compliance with British usage.

module Euler.Problem017
       ( solution
       , spell
       ) where

import Data.Char (isLetter)
import Data.List (intercalate)

solution :: Int -> Integer
solution ceil = sum . map (toInteger . length . filter isLetter . spell) $ [1..ceil]

spell :: Int -> String
spell = intercalate " " . digits

digits :: Int -> [String]
digits n
  | n < 1 = []
  | n < 20 = [smallNumbers n]
  | n < 100 = [tensAndOnes $ n `divMod` 10]
  | n < 1000 = hundredsPlus $ n `divMod` 100
  | otherwise = [smallNumbers 1, scaleNumbers 1]

hundredsPlus :: (Int, Int) -> [String]
hundredsPlus (h, 0) = hundreds h
hundredsPlus (h, t) = hundreds h ++ ["and"] ++ digits t

hundreds :: Int -> [String]
hundreds h = [smallNumbers h, scaleNumbers 0]

tensAndOnes :: (Int, Int) -> String
tensAndOnes (t, 0) = tens t
tensAndOnes (t, o) = tens t ++ "-" ++ smallNumbers o

smallNumbers :: Int -> String
smallNumbers = (!!) [ "zero"
                    , "one"
                    , "two"
                    , "three"
                    , "four"
                    , "five"
                    , "six"
                    , "seven"
                    , "eight"
                    , "nine"
                    , "ten"
                    , "eleven"
                    , "twelve"
                    , "thirteen"
                    , "fourteen"
                    , "fifteen"
                    , "sixteen"
                    , "seventeen"
                    , "eighteen"
                    , "nineteen"
                    ]

tens :: Int -> String
tens = (!!) [ ""
            , ""
            , "twenty"
            , "thirty"
            , "forty"
            , "fifty"
            , "sixty"
            , "seventy"
            , "eighty"
            , "ninety"
            ]

scaleNumbers :: Int -> String
scaleNumbers = (!!) [ "hundred"
                    , "thousand"
                    ]
