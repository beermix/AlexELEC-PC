################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-2016 Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="nss"
PKG_VERSION="3.22.3"
PKG_REV="2"
PKG_ARCH="any"
PKG_LICENSE="Mozilla Public License"
PKG_SITE="http://ftp.mozilla.org/"
PKG_URL="http://ftp.mozilla.org/pub/security/nss/releases/NSS_3_22_3_RTM/src/nss-3.22.3-with-nspr-4.12.tar.gz"
PKG_DEPENDS_TARGET="toolchain nss:host nspr zlib"
PKG_PRIORITY="optional"
PKG_SECTION="xmedia/depends"
PKG_SHORTDESC="The Network Security Services (NSS) package is a set of libraries designed to support cross-platform development of security-enabled client and server applications"
PKG_LONGDESC="The Network Security Services (NSS) package is a set of libraries designed to support cross-platform development of security-enabled client and server applications"
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

MAKEFLAGS=-j1

make_host() {
  cd $ROOT/$PKG_BUILD/nss
  export USE_64=1
  make -C coreconf/nsinstall  
}

makeinstall_host() {
  cp $ROOT/$PKG_BUILD/nss/coreconf/nsinstall/*/nsinstall $ROOT/$TOOLCHAIN/bin
}

post_makeinstall_host() {
  rm -rf $ROOT/$PKG_BUILD/nss/coreconf/nsinstall/Linux*
}

make_target() {
  cd $ROOT/$PKG_BUILD/nss

  make BUILD_OPT=1 USE_64=1 \
     NSPR_INCLUDE_DIR=$SYSROOT_PREFIX/usr/include/nspr \
     USE_SYSTEM_ZLIB=1 ZLIB_LIBS=-lz \
     OS_TEST=$TARGET_ARCH \
     NSS_TESTS="dummy" \
     NSINSTALL=$ROOT/$TOOLCHAIN/bin/nsinstall \
     CPU_ARCH_TAG=$TARGET_ARCH \
     CC=$TARGET_CC LDFLAGS="$LDFLAGS -L$SYSROOT_PREFIX/usr/lib" \
     V=1
}

makeinstall_target() {
  cd $ROOT/$PKG_BUILD
  $STRIP dist/Linux*/lib/*.so
  # target for Chromium
  mkdir -p $INSTALL/usr/config/chromium/lib
  cp -L dist/Linux*/lib/*.so $INSTALL/usr/config/chromium/lib
  # host
  rm -f dist/Linux*/lib/libsqlite3.so
  cp -L dist/Linux*/lib/*.so $SYSROOT_PREFIX/usr/lib
  cp -L dist/Linux*/lib/libcrmf.a $SYSROOT_PREFIX/usr/lib
  mkdir -p $SYSROOT_PREFIX/usr/include/nss
  cp -RL dist/{public,private}/nss/* $SYSROOT_PREFIX/usr/include/nss
  cp -L dist/Linux*/lib/pkgconfig/nss.pc $SYSROOT_PREFIX/usr/lib/pkgconfig
}

