#!/bin/bash
set -x

env | sort

export CPP_INCLUDE_PATH=$PREFIX/include
export CXX_INCLUDE_PATH=$PREFIX/include
export CPLUS_INCLUDE_PATH=$PREFIX/include
export LD_LIBRARY_PATH=$PREFIX/lib
if [ "$OSX_ARCH" = arm64 ]; then
  # https://github.com/zeroc-ice/ice-packaging/blob/v3.6.5/ice/pypi/setup.py#L49-L51
  export ARCHFLAGS="-arch arm64"
fi
$PYTHON -m pip install . --ignore-installed --no-deps -vv
