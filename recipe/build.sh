#!/bin/bash

set -exo pipefail

if [[ "${target_platform}" == "osx-"* ]]; then
    export CC=$(command -v clang)
fi

if [[ "${target_platform}" == "osx-arm64" ]]; then
    ./configure --prefix=${PREFIX} --disable-nls
else
    ./configure --prefix=${PREFIX}
fi

make install-binary -j${CPU_COUNT}
