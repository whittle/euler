module Main where

import Criterion.Main (defaultConfig, defaultMainWith)
import Criterion.Types (Config(..))

import qualified Math.CombinatoricsBench

main :: IO ()
main = defaultMainWith config
       [ Math.CombinatoricsBench.group
       ]

config :: Config
config = defaultConfig { reportFile = Just "bench/results.html" }
