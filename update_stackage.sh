#!/usr/bin/env bash

set -e

wget -N -O .stackage https://www.stackage.org/nightly/cabal.config
cat .cabal .stackage > cabal.config
cabal update
cabal install --only-dependencies
