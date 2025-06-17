#!/bin/bash

if [[ "${target_platform}" == "osx-"* ]]; then
    export CC=$(command -v clang)
fi

export A2XFLAGS="--no-xmllint -v --xsltproc-opts=\"--maxdepth 1000000\" \
    --xsl-file=${BUILD_PREFIX}/share/docbook-xsl/manpages/docbook.xsl"

for f in "${BUILD_PREFIX}/lib/python2.7"/_sysconfigdata_*_conda*_linux_gnu.py; do
    arch=${HOST%%-*}
    cp -p "$f" "${BUILD_PREFIX}/lib/python2.7/_sysconfigdata_${arch}_conda_linux_gnu.py"
    break
done

./configure --prefix=${PREFIX}

pushd po
make yash.pot
msginit --no-translator -l en@boldquot -i yash.pot -o en@boldquot.po
sed -i 's/charset=ASCII/charset=UTF-8/' en@boldquot.po
popd

make -j${CPU_COUNT}
make install
