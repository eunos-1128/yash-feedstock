  #!/bin/bash

export PKG_CONFIG_PATH="${BUILD_PREFIX}/lib/pkgconfig:${PKG_CONFIG_PATH}"
export CFLAGS="-I${PREFIX}/include ${CFLAGS}"
export LDFLAGS="-L${PREFIX}/lib ${LDFLAGS}"

if [[ "${target_platform}" == "osx-"* ]]; then
    export CC=$(command -v clang)
fi

./configure --prefix=${PREFIX}
make install-binary -j${CPU_COUNT}
