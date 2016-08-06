################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.ru
#      Copyright (C) 2011-2016 Alexandr Zuyev (alex@alexelec.ru)
################################################################################

PKG_NAME="vdr-all"
PKG_VERSION="2.2.0"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://www.alexelec.ru"
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain vdr"
PKG_PRIORITY="optional"
PKG_SECTION="virtual"
PKG_SHORTDESC="vdr-all: Metapackage for installing VDR package"
PKG_LONGDESC="vdr-all is a Metapackage for installing VDR package"
PKG_AUTORECONF="no"
PKG_IS_ADDON="no"

PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET vdr-plugin-dvbapi"
PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET vdr-plugin-softhddevice"
PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET vdr-plugin-vnsiserver"
PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET vdr-plugin-xvdr"
PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET vdr-skin-nopacity"
PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET vdr-plugin-skindesigner"
