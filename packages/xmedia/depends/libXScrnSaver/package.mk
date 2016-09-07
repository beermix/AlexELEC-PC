################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-2016 Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="libXScrnSaver"
PKG_VERSION="1.2.2"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://xorg.freedesktop.org/"
PKG_URL="http://xorg.freedesktop.org/releases/individual/lib/$PKG_NAME-$PKG_VERSION.tar.bz2"
PKG_DEPENDS_TARGET="toolchain scrnsaverproto"
PKG_PRIORITY="optional"
PKG_SECTION="xmedia/depends"
PKG_SHORTDESC=""
PKG_LONGDESC=""
PKG_IS_ADDON="no"
PKG_AUTORECONF="yes"

PKG_CONFIGURE_OPTS_TARGET="--enable-static --disable-shared --enable-malloc0returnsnull"
