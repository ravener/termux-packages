TERMUX_PKG_HOMEPAGE=https://github.com/Martchus/tageditor
TERMUX_PKG_DESCRIPTION="A tag editor with Qt GUI and command-line interface. Supports MP4 (iTunes), ID3, Vorbis, Opus, FLAC and Matroska"
TERMUX_PKG_LICENSE="GPL-2.0"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION=3.7.6
TERMUX_PKG_REVISION=1
TERMUX_PKG_SRCURL=https://github.com/Martchus/tageditor/archive/refs/tags/v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=48991e04a95caeaa60a458a3c05b127d96268a2c3092487010ba7f1fe7c94f3e
TERMUX_PKG_DEPENDS="libc++, libc++utilities, qt5-qtbase, qt5-qtdeclarative, qtutilities, tagparser"
TERMUX_PKG_BUILD_DEPENDS="qt5-qtbase-cross-tools, qt5-qtdeclarative-cross-tools, qt5-qttools-cross-tools"
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="
-DWEBVIEW_PROVIDER=none
"

termux_step_pre_configure() {
	CXXFLAGS+=" -std=c++17"
}
