module Main where

import Test.Tasty (defaultMain,testGroup,TestTree)

import Euler.Swallow.Test
import Euler.Coconut.Test

main :: IO ()
main = defaultMain tests

tests :: TestTree
tests = testGroup "All Tests"
            [ swallowSuite
            , coconutSuite
            ]
