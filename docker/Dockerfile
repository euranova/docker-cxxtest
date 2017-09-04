FROM alpine:3.6

# ply is installed to allow cxxtestgen to be used with the FOG parser for
# test discovery.
# See http://cxxtest.com/guide.html#_test_discovery_options
RUN apk update \
  && apk add python3=3.6.1-r2 \
             g++=6.3.0-r4 \
             make=4.2.1-r0 \
  && ln -s /usr/bin/python3 /usr/bin/python \
  && pip3 install ply==3.10

COPY cxxtest /cxxtest
ENV PATH="/cxxtest/bin:${PATH}" CXXTEST="/cxxtest"

RUN /bin/sh
