################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-2016 Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="unclutter"
PKG_VERSION="1.09"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="Public Domain"
PKG_SITE="https://sourceforge.net/projects/unclutter/"
PKG_URL="http://jaist.dl.sourceforge.net/project/unclutter/unclutter/source_$PKG_VERSION/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain libX11"
PKG_PRIORITY="optional"
PKG_SECTION="x11"
PKG_SHORTDESC="Unclutter: Hide X11 Cursor"
PKG_LONGDESC="Unclutter runs in the background of an X11 session and after a specified period of inactivity hides the cursor from display. When the cursor is moved its display is restored. Users may specify specific windows to be ignored by unclutter."
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

make_target() {
  rm -f Makefile
  LDFLAGS="$LDFLAGS -lX11" $MAKE unclutter
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/bin
    cp unclutter $INSTALL/usr/bin/
}

post_install() {
  enable_service unclutter.service
}
