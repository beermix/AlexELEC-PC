################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-2016 Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="libxcb"
PKG_VERSION="1.12"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="OSS"
PKG_SITE="http://xcb.freedesktop.org"
PKG_URL="http://xcb.freedesktop.org/dist/$PKG_NAME-$PKG_VERSION.tar.bz2"
PKG_DEPENDS_TARGET="toolchain util-macros Python:host xcb-proto libpthread-stubs libXau"
PKG_PRIORITY="optional"
PKG_SECTION="x11/lib"
PKG_SHORTDESC="libxcb: X C-language Bindings library"
PKG_LONGDESC="X C-language Bindings library."
PKG_IS_ADDON="no"
PKG_AUTORECONF="yes"

pre_configure_target() {
  PYTHON_LIBDIR="`ls -d $SYSROOT_PREFIX/usr/lib/python*`"
  PYTHON_TOOLCHAIN_PATH=`ls -d $PYTHON_LIBDIR/site-packages`

  PKG_CONFIG="$PKG_CONFIG --define-variable=pythondir=$PYTHON_TOOLCHAIN_PATH"
  PKG_CONFIG="$PKG_CONFIG --define-variable=xcbincludedir=$SYSROOT_PREFIX/usr/share/xcb"

  CFLAGS="$CFLAGS -fPIC -DPIC"
}
