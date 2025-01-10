#!/bin/bash
export CPP_INCLUDE_PATH=$PREFIX/include
export CXX_INCLUDE_PATH=$PREFIX/include
export CPLUS_INCLUDE_PATH=$PREFIX/include
export LD_LIBRARY_PATH=$PREFIX/lib
if [ "$OSX_ARCH" = arm64 ]; then
  # https://github.com/zeroc-ice/ice-packaging/blob/v3.6.5/ice/pypi/setup.py#L49-L51
  export ARCHFLAGS="-arch arm64"
  # https://travis-ci.community/t/osx-image-xcode12-2-does-not-come-with-macos-11-sdk-no-way-to-compile-for-arm/10611
  export EXTRA_COMPILE_ARGS="-target arm64-apple-macos11"
fi
if [[ "$target_platform" == osx-* ]]; then
  export CXXFLAGS="${CXXFLAGS} -D_LIBCPP_ENABLE_CXX17_REMOVED_UNARY_BINARY_FUNCTION -D_LIBCPP_ENABLE_CXX17_REMOVED_BINDERS -D_LIBCPP_ENABLE_CXX17_REMOVED_RANDOM_SHUFFLE -Wno-register"
  export CFLAGS="${CFLAGS} -D_POSIX_C_SOURCE=200809L"
fi
$PYTHON -m pip install . --ignore-installed --no-deps -vv
