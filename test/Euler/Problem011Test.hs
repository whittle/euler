module Euler.Problem011Test (suite) where

import Test.Tasty (testGroup, TestTree)
import Test.Tasty.HUnit
import Numeric.LinearAlgebra.Data (toList, takeDiag, subMatrix)

import Euler.Problem011

suite :: TestTree
suite = testGroup "Problem011"
        [ testCase "number of vectors" testVectorsCount
        , testCase "number of submatrices" testSubmatrices
        , testCase "selected cells" testSelectedCells
        ]

testVectorsCount :: Assertion
testVectorsCount = 10 @=? (length . vectors . head $ submatrices 4)

testSubmatrices :: Assertion
testSubmatrices = 17 * 17 @=? (length $ submatrices 4)

testSelectedCells :: Assertion
testSelectedCells = [26, 63, 78, 14] @=? (toList . takeDiag . subMatrix (6, 8) (4, 4) $ matrix)
