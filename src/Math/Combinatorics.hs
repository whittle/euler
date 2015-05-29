module Math.Combinatorics
       ( combinationsWithRep
       , combinationsWithRepSlow
       ) where

-- http://rosettacode.org/wiki/Combinations_with_repetitions#Haskell

combinationsWithRep :: Int -> [a] -> [[a]]
combinationsWithRep k xs = combinationsBySize xs !! k
 where combinationsBySize = foldr f ([[]] : repeat [])
       f x next = scanl1 (\z n -> map (x:) z ++ n) next

combinationsWithRepSlow :: Int -> [a] -> [[a]]
combinationsWithRepSlow 0 _ = [[]]
combinationsWithRepSlow _ [] = []
combinationsWithRepSlow k xxs@(x:xs) = map (x:) (combinationsWithRepSlow (k-1) xxs)
                                    ++ combinationsWithRepSlow k xs
