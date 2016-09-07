################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-2016 Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="nspr"
PKG_VERSION="4.12"
PKG_REV="2"
PKG_ARCH="any"
PKG_LICENSE="Mozilla Public License"
PKG_SITE="http://www.linuxfromscratch.org/blfs/view/svn/general/nspr.html"
PKG_DEPENDS_TARGET="toolchain nss:host"
PKG_PRIORITY="optional"
PKG_SECTION="xmedia/depends"
PKG_SHORTDESC="Netscape Portable Runtime (NSPR) provides a platform-neutral API for system level and libc like functions"
PKG_LONGDESC="Netscape Portable Runtime (NSPR) provides a platform-neutral API for system level and libc like functions"
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

MAKEFLAGS=-j1

PKG_CONFIGURE_OPTS_TARGET="--with-pthreads --enable-64bit"
PKG_MAKE_OPTS_TARGET="NSINSTALL=$ROOT/$TOOLCHAIN/bin/nsinstall"
PKG_MAKEINSTALL_OPTS_TARGET="NSINSTALL=$ROOT/$TOOLCHAIN/bin/nsinstall"

configure_target() {
  cd $(get_build_dir nss)/nspr
  ./configure --with-pthreads --enable-64bit $TARGET_CONFIGURE_OPTS 
}
