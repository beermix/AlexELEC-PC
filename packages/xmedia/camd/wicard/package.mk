################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-2016 Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="wicard"
PKG_VERSION="1.19"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://www.alexelec.in.ua"
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain"
PKG_PRIORITY="optional"
PKG_SECTION="xmedia/camd"
PKG_SHORTDESC="wicard"
PKG_LONGDESC="wicard CAM."
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

make_target() {
  : # nothing to do here
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/config/wicard
    cp $PKG_DIR/config/* $INSTALL/usr/config/wicard
  mkdir -p $INSTALL/usr/bin
    cp $PKG_DIR/scripts/* $INSTALL/usr/bin

  # support 32bit libs for Wicard
  mkdir -p $INSTALL/lib/
    cp -p $PKG_DIR/lib32/* $INSTALL/lib
}

post_install() {
  enable_service wicard.service
}
