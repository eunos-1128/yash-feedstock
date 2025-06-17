#!/bin/bash

set -exo pipefail

if [[ "${target_platform}" == "osx-"* ]]; then
    export CC=$(command -v clang)
fi

./configure --prefix=${PREFIX}
make install-binary -j${CPU_COUNT}
