	
#!/bin/bash

set -ex

mkdir build
pushd build

meson setup --prefix=${PREFIX} \
      --buildtype=release \
      --libdir=$PREFIX/lib \
      -Ddefault_library=shared \
      -Dorc-test=disabled \
      -Dbenchmarks=disabled \
      -Dexamples=disabled \
      -Dtests=disabled \
      -Dtools=enabled \
      --wrap-mode=nofallback \
      ..
ninja -j${CPU_COUNT}
ninja install
