module Euler.Problem018.Test (suite) where

import Test.Tasty (testGroup, TestTree)
import Test.Tasty.HUnit

import Euler.Problem018

suite :: TestTree
suite = testGroup "Problem018"
        [ testCase "four-row triangle" test4
        , testCase "transform a one-row triangle" testTransformSingle
        , testCase "transform a two-row triangle" testTransformDouble
        , testCase "transformas a three-row triangle" testTransformTriple
        , testCase "makes a triangle out of the contents of an input file" testMkTriangle
        ]

test4 :: Assertion
test4 = 23 @=? best [[3], [7, 4], [2, 4, 6], [8, 5, 9, 3]]

testTransformSingle :: Assertion
testTransformSingle = [[3]] @=? (transform $ take 1 example)

testTransformDouble :: Assertion
testTransformDouble = [[10, 7], [3]] @=? (transform $ take 2 example)

testTransformTriple :: Assertion
testTransformTriple = [[12, 14, 13], [10, 7], [3]] @=? (transform $ take 3 example)

example :: [[Int]]
example = [[3], [7, 4], [2, 4, 6], [8, 5, 9, 3]]

testMkTriangle :: Assertion
testMkTriangle = [[75], [95, 64], [17, 47, 82]] @=? mkTriangle "75\n95 64\n17 47 82\n"
