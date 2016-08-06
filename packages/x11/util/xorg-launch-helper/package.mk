################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-2016 Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="xorg-launch-helper"
PKG_VERSION="4"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL-2"
PKG_SITE="https://github.com/sofar/xorg-launch-helper"
PKG_URL="http://foo-projects.org/~sofar/${PKG_NAME}/${PKG_NAME}-${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain systemd"
PKG_PRIORITY="optional"
PKG_SECTION="x11/util"
PKG_SHORTDESC="Xorg-launch-helper is a small utility that transforms the X server process (XOrg) into a daemon."
PKG_LONGDESC="Xorg-launch-helper is a small utility that transforms the X server process (XOrg) into a daemon that can be used to make applications wait with starting until XOrg is ready for X11 connections"

PKG_IS_ADDON="no"
PKG_AUTORECONF="yes"

pre_configure_target() {
  export LIBS="-lsystemd"
}

post_makeinstall_target() {
  # do not install systemd services
  rm -rf $INSTALL/usr/lib
  mkdir -p $INSTALL/usr/bin
  cp -P $PKG_DIR/scripts/xorg-launch $INSTALL/usr/bin
}
