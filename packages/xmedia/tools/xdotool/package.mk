################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-2016 Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="xdotool"
PKG_VERSION="2.20110530.1"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://www.semicomplete.com/projects/xdotool/"
PKG_URL="http://semicomplete.googlecode.com/files/${PKG_NAME}-${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain libXinerama libXtst"
PKG_PRIORITY="optional"
PKG_SECTION="xmedia/tools"
PKG_SHORTDESC="This tool lets you simulate keyboard input and mouse activity, move and resize windows, etc."
PKG_LONGDESC="This tool lets you simulate keyboard input and mouse activity, move and resize windows, etc."
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

pre_configure_target() {
  LDFLAGS="$LDFLAGS -lXext"
}

make_target() {
  : none
}

makeinstall_target() {
  make DESTDIR=$INSTALL PREFIX=/usr install-static
}
