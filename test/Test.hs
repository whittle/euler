module Main where

import Test.Tasty (defaultMain, testGroup, TestTree)

import qualified Euler.Primes.Test
import qualified Euler.Problem001.Test
import qualified Euler.Problem002.Test
import qualified Euler.Problem003.Test
import qualified Euler.Problem004.Test
import qualified Euler.Problem005.Test
import qualified Euler.Problem006.Test
import qualified Euler.Problem007.Test
import qualified Euler.Problem008.Test
import qualified Euler.Problem009.Test
import qualified Euler.Problem010.Test
import qualified Euler.Problem011.Test
import qualified Euler.Problem012.Test
import qualified Euler.Problem013.Test
import qualified Euler.Problem014.Test
import qualified Euler.Problem015.Test
import qualified Euler.Problem016.Test
import qualified Euler.Problem017.Test

main :: IO ()
main = defaultMain tests

tests :: TestTree
tests = testGroup "All Tests"
        [ Euler.Primes.Test.suite
        , Euler.Problem001.Test.suite
        , Euler.Problem002.Test.suite
        , Euler.Problem003.Test.suite
        , Euler.Problem004.Test.suite
        , Euler.Problem005.Test.suite
        , Euler.Problem006.Test.suite
        , Euler.Problem007.Test.suite
        , Euler.Problem008.Test.suite
        , Euler.Problem009.Test.suite
        , Euler.Problem010.Test.suite
        , Euler.Problem011.Test.suite
        , Euler.Problem012.Test.suite
        , Euler.Problem013.Test.suite
        , Euler.Problem014.Test.suite
        , Euler.Problem015.Test.suite
        , Euler.Problem016.Test.suite
        , Euler.Problem017.Test.suite
        ]
