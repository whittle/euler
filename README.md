Haskell solutions to Project Euler problems.

![Project Euler](https://projecteuler.net/profile/whittle.png)

[![Build Status](https://travis-ci.org/whittle/euler.svg?branch=master)](https://travis-ci.org/whittle/euler)

Tested with the following versions:
  * GHC 7.10.1
  * cabal-install 1.22.2.0
  * LAPACK 3.5
  * BLAS 1.2

To configure for the current Stackage nightly, install
[wget](https://www.gnu.org/software/wget/) and run the included
`update_stackage.sh` script, which will generate a `cabal.config`
file.

For a fast development cycle, install [entr](http://entrproject.org/)
and run the included `test/loop.sh` script.

The output of the benchmarks is available on [the corresponding GitHub
page](http://whittle.github.io/euler/benchmarks.html).
