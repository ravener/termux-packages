TERMUX_PKG_HOMEPAGE=https://docs.xfce.org/xfce/thunar/start
TERMUX_PKG_DESCRIPTION="Modern file manager for XFCE environment"
TERMUX_PKG_LICENSE="GPL-2.0, LGPL-2.0"
TERMUX_PKG_MAINTAINER="@termux"
_MAJOR_VERSION=4.18
TERMUX_PKG_VERSION=${_MAJOR_VERSION}.1
TERMUX_PKG_SRCURL=https://archive.xfce.org/src/xfce/thunar/${_MAJOR_VERSION}/thunar-${TERMUX_PKG_VERSION}.tar.bz2
TERMUX_PKG_SHA256=2b0e91802ca4d5f4e25cc8a76a6c362f47d02d00b0184344945b33d0c43a3166
TERMUX_PKG_DEPENDS="atk, desktop-file-utils, exo, gdk-pixbuf, glib, gtk3, harfbuzz, libcairo, libexif, libice, libnotify, libsm, libx11, libxfce4ui, libxfce4util, pango, pcre2, shared-mime-info, xfce4-panel, xfconf"
TERMUX_PKG_BUILD_DEPENDS="g-ir-scanner"
TERMUX_PKG_RECOMMENDS="gvfs, hicolor-icon-theme, thunar-archive-plugin, tumbler"
TERMUX_PKG_DISABLE_GIR=true
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="
--enable-gtk-doc-html=no
--enable-introspection=yes
"
TERMUX_PKG_BUILD_IN_SRC=true

termux_step_pre_configure() {
	termux_setup_gir
}
