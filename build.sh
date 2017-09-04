CXXTEST_VERSION=4.4
CXXTEST_ARCHIVE=cxxtest-${CXXTEST_VERSION}.tar.gz
CXXTEST_EXTRACT=cxxtest-${CXXTEST_VERSION}
BUILD_DIR=build
CXXTEST_OUT_DIR=${BUILD_DIR}/cxxtest
IMAGE=euranova/cxxtest:${CXXTEST_VERSION}

wget https://github.com/CxxTest/cxxtest/releases/download/${CXXTEST_VERSION}/${CXXTEST_ARCHIVE}

tar xf ${CXXTEST_ARCHIVE}

mkdir -p ${CXXTEST_OUT_DIR}/bin

cp ${CXXTEST_EXTRACT}/bin/cxxtestgen ${CXXTEST_OUT_DIR}/bin
cp -r ${CXXTEST_EXTRACT}/python ${CXXTEST_OUT_DIR}
cp -r ${CXXTEST_EXTRACT}/cxxtest ${CXXTEST_OUT_DIR}

cp docker/Dockerfile ${BUILD_DIR}

docker build -t ${IMAGE} ${BUILD_DIR}
