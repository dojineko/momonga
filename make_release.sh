#!/bin/bash

REPO="momonga"
BASE_DIR="`dirname $0`"
BUILD_DIR="${BASE_DIR}/mruby/build"
RELEASE_DIR="${BASE_DIR}/release"

[ -d "${BUILD_DIR}" ] || exit 1

# RELEASE_DIR を作りなおす
rm -rf ./${RELEASE_DIR} 2>/dev/null
mkdir -p ${RELEASE_DIR}

# リリース用のzipを作る
for i in `ls -1d ${BUILD_DIR}/*86*`; do
    DIR_NAME=`basename $i`
    zip -jv ${RELEASE_DIR}/${REPO}_${DIR_NAME}.zip ${i}/bin/momonga*
done

# 結果を表示する
ls -la ${RELEASE_DIR}
