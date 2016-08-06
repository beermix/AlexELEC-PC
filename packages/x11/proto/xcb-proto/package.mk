################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-2016 Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="xcb-proto"
PKG_VERSION="1.12"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="OSS"
PKG_SITE="http://www.X.org"
PKG_URL="http://xcb.freedesktop.org/dist/$PKG_NAME-$PKG_VERSION.tar.bz2"
PKG_DEPENDS_TARGET="toolchain util-macros Python:host"
PKG_PRIORITY="optional"
PKG_SECTION="x11/proto"
PKG_SHORTDESC="xcb-proto: X C-language Bindings protocol headers"
PKG_LONGDESC="X C-language Bindings protocol headers."
PKG_IS_ADDON="no"
PKG_AUTORECONF="yes"

# package specific configure options
PKG_CONFIGURE_OPTS_TARGET="--without-xmlto"
