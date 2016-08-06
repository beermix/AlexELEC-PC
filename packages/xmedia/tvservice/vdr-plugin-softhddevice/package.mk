################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-2016 Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="vdr-plugin-softhddevice"
PKG_VERSION="6dfa88a"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/pesintta/vdr-plugin-softhddevice/"
PKG_SITE="http://projects.vdr-developer.org/projects/plg-softhddevice"
PKG_URL="https://projects.vdr-developer.org/git/vdr-plugin-softhddevice.git/snapshot/$PKG_NAME-$PKG_VERSION.tar.bz2"
PKG_DEPENDS_TARGET="toolchain vdr xcb-util-keysyms xcb-util-wm xcb-util-renderutil xcb-util-image"
PKG_PRIORITY="optional"
PKG_SECTION="xmedia/tvservice"
PKG_SHORTDESC="vdr softhddevice"
PKG_LONGDESC="vdr softhddevice"
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"
PKG_LOCALE_INSTALL="yes"

make_target() {
  VDR_DIR=$(get_build_dir vdr)
  make VDRDIR=$VDR_DIR \
       GIT_REV=$PKG_VERSION \
       OSS=0
}
