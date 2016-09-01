################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-2016 Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="s2-liplianin"
PKG_VERSION="v39.40"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://bitbucket.org/CrazyCat/s2-liplianin-v39/"
PKG_URL="$ALEXELEC_SRC/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="toolchain linux"
PKG_NEED_UNPACK="$LINUX_DEPENDS"
PKG_PRIORITY="optional"
PKG_SECTION="xmedia/dvb"
PKG_SHORTDESC="DVB-S(S2) drivers for Linux - Igor M. Liplianin repo (v39)"
PKG_LONGDESC="DVB-S(S2) drivers for Linux - Igor M. Liplianin repo (v39)."
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

pre_make_target() {
  export KERNEL_VER=$(get_module_dir)
  # dont use our LDFLAGS, use the KERNEL LDFLAGS
  export LDFLAGS=""
}

make_target() {
  make DIR=$(kernel_path) clean
  make DIR=$(kernel_path) prepare
  make DIR=$(kernel_path)
}

makeinstall_target() {
  : # not
}

post_install() {
  MOD_VER=`ls $BUILD/linux*/.install_pkg/lib/modules`

  # install s2-liplianin drivers
  cp -Pa $INSTALL/lib/modules/$MOD_VER $INSTALL/lib/modules/$MOD_VER-s2
  mkdir -p $INSTALL/lib/modules/$MOD_VER-s2/updates/s2
  find $ROOT/$PKG_BUILD/ -name \*.ko -exec cp {} $INSTALL/lib/modules/$MOD_VER-s2/updates/s2 \;
  rm -f  $INSTALL/lib/modules/$MOD_VER-s2/updates/s2/lirc_dev.ko
  rm -f  $INSTALL/lib/modules/$MOD_VER-s2/updates/s2/rc-core.ko
  echo "s2-liplianin drivers version: $PKG_VERSION" > $INSTALL/lib/modules/$MOD_VER-s2/updates/s2-drivers.txt
}
