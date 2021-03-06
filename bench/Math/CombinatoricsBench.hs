module Math.CombinatoricsBench (group) where

import Criterion.Main

import Math.Combinatorics

group :: Benchmark
group = bgroup "Math.Combinatorics"
        [ combinationsWithRepGroup
        , combinationsWithRepSlowGroup
        ]

combinationsWithRepGroup :: Benchmark
combinationsWithRepGroup = bgroup "combinationsWithRep" [
    bench "3 out of 10" $ nf (combinationsWithRep 3) [(0::Int)..9]
  , bench "5 out of 10" $ nf (combinationsWithRep 5) [(0::Int)..9]
  , bench "7 out of 10" $ nf (combinationsWithRep 7) [(0::Int)..9]
  ]

combinationsWithRepSlowGroup :: Benchmark
combinationsWithRepSlowGroup = bgroup "combinationsWithRepSlow" [
    bench "3 out of 10" $ nf (combinationsWithRepSlow 3) [(0::Int)..9]
  , bench "5 out of 10" $ nf (combinationsWithRepSlow 5) [(0::Int)..9]
  , bench "7 out of 10" $ nf (combinationsWithRepSlow 7) [(0::Int)..9]
  ]
