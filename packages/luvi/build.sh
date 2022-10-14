TERMUX_PKG_HOMEPAGE=https://luvit.io
TERMUX_PKG_DESCRIPTION="A project in-between luv and luvit."
TERMUX_PKG_LICENSE="Apache-2.0"
TERMUX_PKG_MAINTAINER="@ravener"
TERMUX_PKG_VERSION=2.14.0
TERMUX_PKG_SRCURL=https://github.com/luvit/luvi/releases/download/v${TERMUX_PKG_VERSION}/luvi-src-v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=4be4468d01657100967a9c696f503aa3c30de6f23af39050c1aae909fbf0aaf2
TERMUX_PKG_DEPENDS="openssl, zlib"
TERMUX_PKG_BUILD_IN_SRC=true

termux_step_host_build() {
  termux_setup_cmake
  export PATH="$PATH:$TERMUX_PKG_HOSTBUILD_DIR/build/luvi/src/deps/luv"
  cmake -H. -Bbuild -DCMAKE_BUILD_TYPE=Release -DWithSharedLibluv=OFF -DWithOpenSSL=ON -DWithSharedOpenSSL=OFF -DWithOpenSSLASM=ON -DWithPCRE=ON -DWithLPEG=ON -DWithSharedPCRE=OFF -DCMAKE_C_COMPILER="${CC}" -DCMAKE_ASM_COMPILER="${CC}" -DCMAKE_CXX_COMPILER="${CXX}"
  cmake --build build -j $TERMUX_MAKE_PROCESSES
}

termux_step_post_make_install() {
  mv build/luvi $TERMUX_PREFIX/bin
}
