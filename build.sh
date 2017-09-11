#!/bin/bash
cd "$(dirname "$0")"

CXXTEST_VERSION=4.4
IMAGE=euranova/cxxtest:${CXXTEST_VERSION}

docker build -t ${IMAGE} docker
