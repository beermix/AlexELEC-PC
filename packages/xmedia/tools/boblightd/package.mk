################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-2016 Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="boblightd"
PKG_VERSION="479"
PKG_REV="0"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://code.google.com/p/boblight"
PKG_URL="$ALEXELEC_SRC/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="toolchain libusb libX11 libXext libXrender mesa glu"
PKG_PRIORITY="optional"
PKG_SECTION="xmedia/tools"
PKG_SHORTDESC="boblightd: an ambilight controller."
PKG_LONGDESC="Boblight's main purpose is to create light effects from an external input, such as a video stream."
PKG_IS_ADDON="no"
PKG_AUTORECONF="yes"

PKG_CONFIGURE_OPTS_TARGET="--without-portaudio \
                           --sysconfdir=/storage/.config/boblight \
                           --enable-shared \
                           --disable-static"

post_makeinstall_target() {
  mkdir -p $INSTALL/usr/config/boblight
    cp $PKG_DIR/config/* $INSTALL/usr/config/boblight
  mkdir -p $INSTALL/usr/bin
    cp $PKG_DIR/bin/boblight-x11.start $INSTALL/usr/bin
}

post_install() {
  enable_service boblightd.service
}
