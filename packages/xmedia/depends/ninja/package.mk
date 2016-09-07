################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-2016 Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="ninja"
PKG_VERSION="1.6.0"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="Apache"
PKG_SITE="http://martine.github.io/ninja/"
PKG_URL="https://github.com/ninja-build/ninja/archive/v$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_PRIORITY="optional"
PKG_SECTION="xmedia/depends"
PKG_SHORTDESC="Small build system with a focus on speed"
PKG_LONGDESC="Small build system with a focus on speed"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

configure_host() {
  :
}

make_host() {
  python2 configure.py --bootstrap
}

makeinstall_host() {
  cp ninja $ROOT/$TOOLCHAIN/bin/
}
