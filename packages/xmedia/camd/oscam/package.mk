################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-2016 Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="oscam"
PKG_VERSION="3e2217e"
PKG_REV="0"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://www.streamboard.tv/oscam/wiki"
PKG_URL="http://repo.or.cz/oscam.git/snapshot/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain pcsc-lite"
PKG_PRIORITY="optional"
PKG_SECTION="xmedia/camd"
PKG_SHORTDESC="oscam: OSCam is Open Source Conditional Access Modul."
PKG_LONGDESC="OSCam is Open Source Conditional Access Modul."
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

configure_target() {
  cmake -DCMAKE_TOOLCHAIN_FILE=$CMAKE_CONF \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DLIBUSBDIR=$SYSROOT_PREFIX/usr \
        -DWITH_SSL=0 \
        -DHAVE_LIBCRYPTO=0 \
        -DHAVE_DVBAPI=1 -DWITH_STAPI=0 \
        -DWEBIF=1 \
        -DWITH_DEBUG=0 \
        -DOPTIONAL_INCLUDE_DIR=$SYSROOT_PREFIX/usr/include \
        -DSTATIC_LIBUSB=1 \
        -DCLOCKFIX=0 \
        ..
}

makeinstall_target() {
  mkdir -p  $INSTALL/usr/config/oscam
    cp -a $PKG_DIR/config $INSTALL/usr/config/oscam
  mkdir -p  $INSTALL/usr/bin
    cp $ROOT/$PKG_BUILD/.$TARGET_NAME/oscam $INSTALL/usr/bin
    cp $ROOT/$PKG_BUILD/.$TARGET_NAME/utils/list_smargo $INSTALL/usr/bin
    cp $PKG_DIR/bin/* $INSTALL/usr/bin
}

post_install() {
  enable_service oscam.service
}
