################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-2016 Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="libva-vdpau-driver"
PKG_VERSION="0.7.4"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://freedesktop.org/wiki/Software/vaapi"
PKG_URL="http://freedesktop.org/software/vaapi/releases/$PKG_NAME/$PKG_NAME-$PKG_VERSION.tar.bz2"
PKG_DEPENDS_TARGET="toolchain libva libvdpau mesa"
PKG_PRIORITY="optional"
PKG_SECTION="xmedia/depends"
PKG_SHORTDESC="VDPAU backend for VA API"
PKG_LONGDESC="VDPAU backend for VA API"
PKG_IS_ADDON="no"
PKG_AUTORECONF="yes"

post_makeinstall_target() {
  rm -rf $INSTALL/usr/lib/va/s3g_drv_video.so
}
