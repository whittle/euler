module Math.Combinatorics
       ( combinationsWithRep
       ) where

combinationsWithRep :: Int -> [a] -> [[a]]
combinationsWithRep 0 _ = [[]]
combinationsWithRep _ [] = []
combinationsWithRep k xxs@(x:xs) = map (x:) (combinationsWithRep (k-1) xxs)
                                   ++ combinationsWithRep k xs
