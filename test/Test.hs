module Main where

import Test.Tasty (defaultMain, testGroup, TestTree)

import qualified Math.CombinatoricsTest
import qualified Euler.Factorial.Test
import qualified Math.PrimesTest
import qualified Euler.Problem001Test
import qualified Euler.Problem002Test
import qualified Euler.Problem003Test
import qualified Euler.Problem004Test
import qualified Euler.Problem005Test
import qualified Euler.Problem006Test
import qualified Euler.Problem007Test
import qualified Euler.Problem008Test
import qualified Euler.Problem009Test
import qualified Euler.Problem010Test
import qualified Euler.Problem011Test
import qualified Euler.Problem012Test
import qualified Euler.Problem013Test
import qualified Euler.Problem014Test
import qualified Euler.Problem015Test
import qualified Euler.Problem016Test
import qualified Euler.Problem017Test
import qualified Euler.Problem018Test
import qualified Euler.Problem019Test
import qualified Euler.Problem020Test
import qualified Euler.Problem021Test
import qualified Euler.Problem022Test
import qualified Euler.Problem023Test
import qualified Euler.Problem024Test
import qualified Euler.Problem025Test
import qualified Euler.Problem026Test
import qualified Euler.Problem027Test
import qualified Euler.Problem028Test
import qualified Euler.Problem029Test

main :: IO ()
main = defaultMain tests

tests :: TestTree
tests = testGroup "All Tests"
        [ Math.CombinatoricsTest.suite
        , Euler.Factorial.Test.suite
        , Math.PrimesTest.suite
        , Euler.Problem001Test.suite
        , Euler.Problem002Test.suite
        , Euler.Problem003Test.suite
        , Euler.Problem004Test.suite
        , Euler.Problem005Test.suite
        , Euler.Problem006Test.suite
        , Euler.Problem007Test.suite
        , Euler.Problem008Test.suite
        , Euler.Problem009Test.suite
        , Euler.Problem010Test.suite
        , Euler.Problem011Test.suite
        , Euler.Problem012Test.suite
        , Euler.Problem013Test.suite
        , Euler.Problem014Test.suite
        , Euler.Problem015Test.suite
        , Euler.Problem016Test.suite
        , Euler.Problem017Test.suite
        , Euler.Problem018Test.suite
        , Euler.Problem019Test.suite
        , Euler.Problem020Test.suite
        , Euler.Problem021Test.suite
        , Euler.Problem022Test.suite
        , Euler.Problem023Test.suite
        , Euler.Problem024Test.suite
        , Euler.Problem025Test.suite
        , Euler.Problem026Test.suite
        , Euler.Problem027Test.suite
        , Euler.Problem028Test.suite
        , Euler.Problem029Test.suite
        ]
