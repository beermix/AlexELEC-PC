################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-2016 Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="tbs-crazycat"
PKG_VERSION="7995e07"
PKG_REV="1"
PKG_ARCH="x86_64"
PKG_LICENSE="GPL"
PKG_SITE="https://bitbucket.org/CrazyCat/linux-tbs-drivers/overview"
PKG_URL="https://bitbucket.org/CrazyCat/linux-tbs-drivers/get/${PKG_VERSION}.tar.bz2"
PKG_SOURCE_DIR="CrazyCat-linux-tbs-drivers-${PKG_VERSION}*"
PKG_DEPENDS_TARGET="toolchain linux"
PKG_NEED_UNPACK="$LINUX_DEPENDS"
PKG_PRIORITY="optional"
PKG_SECTION="xmedia/dvb"
PKG_SHORTDESC="Linux TBS tuner drivers and additions from CrazyCat"
PKG_LONGDESC="Linux TBS tuner drivers and additions from CrazyCat."
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

make_target() {
  cd $ROOT/$PKG_BUILD
  ./v4l/tbs-x86_64.sh
  LDFLAGS="" make DIR=$(kernel_path) prepare
  LDFLAGS="" make DIR=$(kernel_path)
}

makeinstall_target() {
  : # not
}

post_install() {
  MOD_VER=`ls $BUILD/linux*/.install_pkg/lib/modules`

  # install TBS-CrazyCat drivers
  cp -Pa $INSTALL/lib/modules/$MOD_VER $INSTALL/lib/modules/$MOD_VER-tbs
  mkdir -p $INSTALL/lib/modules/$MOD_VER-tbs/updates/tbs
  find $ROOT/$PKG_BUILD/ -name \*.ko -exec cp {} $INSTALL/lib/modules/$MOD_VER-tbs/updates/tbs \;
  echo "CrazyCat TBS drivers version: $PKG_VERSION" > $INSTALL/lib/modules/$MOD_VER-tbs/updates/tbs-drivers.txt

  # copy firmware
  mkdir -p $INSTALL/lib/firmware
    cp -f $PKG_DIR/firmware/* $INSTALL/lib/firmware
}
