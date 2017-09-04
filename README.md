# docker-cxxtest

Docker image to test C++ code using [CxxTest](http://cxxtest.com)

## Build

The image can be built using the provided [build.sh](build.sh) script.

## Usage

Run BusyBox in the docker image with the following command:

```sh
docker run --user ${UID} -it -v ${PWD}:/app -w /app euranova/cxxtest:4.4
```

Then, use `cxxtestgen` and `gcc`/`g++` to build tests.

## Documentation

For more information, see [CxxTest's documentation](http://cxxtest.com/guide.html#_a_first_example)
