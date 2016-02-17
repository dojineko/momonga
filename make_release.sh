#!/bin/bash

BASE_DIR="`dirname $0`"
BUILD_DIR="${BASE_DIR}/mruby/build"
RELEASE_DIR="${BASE_DIR}/release"

[ -d "${BUILD_DIR}" ] || exit 1

# RELEASE_DIR を作りなおす
rm -rf ./${RELEASE_DIR} 2>/dev/null
mkdir -p ${RELEASE_DIR}

# リリース用のzipを作る
for i in `ls -1d ${BUILD_DIR}/*86*`; do
    PACKAGE_NAME=`basename $i`
    zip -jv ${RELEASE_DIR}/${PACKAGE_NAME}.zip ${i}/bin/momonga*
done

# 結果を表示する
ls -la ${RELEASE_DIR}
