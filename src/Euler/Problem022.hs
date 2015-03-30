-- Using names.txt (right click and 'Save Link/Target As...'), a 46K
-- text file containing over five-thousand first names, begin by
-- sorting it into alphabetical order. Then working out the
-- alphabetical value for each name, multiply this value by its
-- alphabetical position in the list to obtain a name score.

-- For example, when the list is sorted into alphabetical order,
-- COLIN, which is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name
-- in the list. So, COLIN would obtain a score of 938 × 53 = 49714.

-- What is the total of all the name scores in the file?

module Euler.Problem022
       ( solution
       , inputReader
       , alphabeticalValue
       ) where

import Data.Char (isAlpha, ord)
import Data.List (sort)

solution :: String -> Integer
solution = sum . map score . zip [1..] . sort . inputReader
  where score (i, s) = (i *) . toInteger $ alphabeticalValue s

inputReader :: String -> [String]
inputReader = words . map toSpace
  where toSpace c = if isAlpha c then c else ' '

alphabeticalValue :: String -> Int
alphabeticalValue = sum . map letterValue
  where letterValue c = ord c - 64
