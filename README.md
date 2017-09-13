# docker-cxxtest

Docker image to test C++ code using [CxxTest](http://cxxtest.com)

## Build

The image can be built using the following command from the project root:

```sh
docker build -t euranova/cxxtest .
```

## Usage

Run bash in the docker image with the following command:

```sh
docker run --user ${UID} -it -v ${PWD}:/app euranova/cxxtest
```

Then, use `cxxtestgen` and `gcc`/`g++` to build tests.

The image provides:
- `gcc`/`g++` on the `PATH`
- the `cxxtestgen` executable on the `PATH`
- the `CXXTEST` environment variable, to be used with the `-I` argument of
`gcc`/`g++` to specify the location of the C++ files for cxxtest.

### Warning

When using `cxxtestgen` with the `--fog-parser` option, the following warning is
displayed:
```
WARNING: Couldn't create 'cxxtest.parsetab'.
[Errno 13] Permission denied: '/cxxtest/python/python3/cxxtest/parsetab.py'
```

This warning can safely be ignored. It just means that the FOG parser uses a
library called PLY, which wants to create a file called `parsetab.py` in a
protected location. That file acts as a cache to allow the parser to run faster
on successive runs.

This warning is probably related to long-standing
[issue #3](https://github.com/CxxTest/cxxtest/issues/3).

## Documentation

For more information, see [CxxTest's documentation](http://cxxtest.com/guide.html#_a_first_example)
