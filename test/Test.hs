module Main where

import Test.Tasty (defaultMain, testGroup, TestTree)

import qualified Euler.Problem001.Test
import qualified Euler.Problem002.Test
import qualified Euler.Problem003.Test
import qualified Euler.Problem004.Test
import qualified Euler.Problem005.Test
import qualified Euler.Problem006.Test

main :: IO ()
main = defaultMain tests

tests :: TestTree
tests = testGroup "All Tests"
        [ Euler.Problem001.Test.suite
        , Euler.Problem002.Test.suite
        , Euler.Problem003.Test.suite
        , Euler.Problem004.Test.suite
        , Euler.Problem005.Test.suite
        , Euler.Problem006.Test.suite
        ]
