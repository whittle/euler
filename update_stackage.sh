#!/usr/bin/env bash

set -e

wget -N https://www.stackage.org/nightly/cabal.config
cabal update
cabal install --only-dependencies
