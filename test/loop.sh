#!/usr/bin/env bash

find src test -iname "*.hs" | entr cabal run test-euler
