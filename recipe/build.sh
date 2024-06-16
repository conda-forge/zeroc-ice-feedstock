#!/bin/bash
export CPP_INCLUDE_PATH=$PREFIX/include
export CXX_INCLUDE_PATH=$PREFIX/include
export CPLUS_INCLUDE_PATH=$PREFIX/include
export LD_LIBRARY_PATH=$PREFIX/lib

# Re-enable deprecated unary_function and binary_function
# https://developer.apple.com/documentation/xcode-release-notes/xcode-15-release-notes
export EXTRA_COMPILE_ARGS="-D_LIBCPP_ENABLE_CXX17_REMOVED_UNARY_BINARY_FUNCTION"
if [ "$OSX_ARCH" = arm64 ]; then
  # https://github.com/zeroc-ice/ice-packaging/blob/v3.6.5/ice/pypi/setup.py#L49-L51
  export ARCHFLAGS="-arch arm64"
  # https://travis-ci.community/t/osx-image-xcode12-2-does-not-come-with-macos-11-sdk-no-way-to-compile-for-arm/10611
  export EXTRA_COMPILE_ARGS="$EXTRA_COMPILE_ARGS -target arm64-apple-macos11"
fi
$PYTHON -m pip install . --ignore-installed --no-deps -vv
