FROM alpine:3.6 as builder

ENV CXXTEST_VERSION=4.4
ENV CXXTEST_ARCHIVE=cxxtest-${CXXTEST_VERSION}.tar.gz
ENV CXXTEST_EXTRACT=cxxtest-${CXXTEST_VERSION}
ENV CXXTEST_OUT_DIR=/cxxtest
ENV URL=https://github.com/CxxTest/cxxtest/releases/download/${CXXTEST_VERSION}/${CXXTEST_ARCHIVE}

RUN apk add --no-cache openssl curl
RUN curl -L -s ${URL} > ${CXXTEST_ARCHIVE}
RUN tar xf ${CXXTEST_ARCHIVE}
RUN mkdir -p ${CXXTEST_OUT_DIR}/bin
RUN cp ${CXXTEST_EXTRACT}/bin/cxxtestgen ${CXXTEST_OUT_DIR}/bin
RUN cp -r ${CXXTEST_EXTRACT}/python ${CXXTEST_OUT_DIR}
RUN cp -r ${CXXTEST_EXTRACT}/cxxtest ${CXXTEST_OUT_DIR}


FROM alpine:3.6

# ply is installed to allow cxxtestgen to be used with the FOG parser for
# test discovery.
# See http://cxxtest.com/guide.html#_test_discovery_options
RUN apk add --no-cache python3 g++ make bash \
  && ln -s /usr/bin/python3 /usr/bin/python \
  && pip3 --no-cache-dir install ply==3.10

COPY --from=builder /cxxtest /cxxtest
ENV PATH="/cxxtest/bin:${PATH}" CXXTEST="/cxxtest"

WORKDIR /app
