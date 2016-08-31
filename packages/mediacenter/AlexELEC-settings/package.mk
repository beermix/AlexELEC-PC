################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-2016 Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="AlexELEC-settings"
PKG_VERSION="494d32b"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="prop."
PKG_SITE="http://www.alexelec.in.ua"
PKG_URL="https://github.com/AlexELEC/service.alexelec.settings/archive/$PKG_VERSION.tar.gz"
PKG_SOURCE_DIR="service.alexelec.settings-$PKG_VERSION*"
PKG_DEPENDS_TARGET="toolchain Python connman pygobject dbus-python setxkbmap"
PKG_PRIORITY="optional"
PKG_SECTION=""
PKG_SHORTDESC="AlexELEC-settings: Settings dialog for AlexELEC"
PKG_LONGDESC="AlexELEC-settings: is a settings dialog for AlexELEC"
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

PKG_MAKE_OPTS_TARGET="DISTRONAME=$DISTRONAME ROOT_PASSWORD=$ROOT_PASSWORD"

post_makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/alexelec
    cp $PKG_DIR/scripts/* $INSTALL/usr/lib/alexelec

  python -Wi -t -B $ROOT/$TOOLCHAIN/lib/python2.7/compileall.py $INSTALL/usr/share/kodi/addons/service.alexelec.settings/resources/lib/ -f
  rm -rf `find $INSTALL/usr/share/kodi/addons/service.alexelec.settings/resources/lib/ -name "*.py"`

  python -Wi -t -B $ROOT/$TOOLCHAIN/lib/python2.7/compileall.py $INSTALL/usr/share/kodi/addons/service.alexelec.settings/oe.py -f
  rm -rf $INSTALL/usr/share/kodi/addons/service.alexelec.settings/oe.py

  python -Wi -t -B $ROOT/$TOOLCHAIN/lib/python2.7/compileall.py $INSTALL/usr/share/kodi/addons/service.alexelec.settings/defaults.py -f
  rm -rf $INSTALL/usr/share/kodi/addons/service.alexelec.settings/defaults.py
}

post_install() {
  enable_service backup-restore.service
  enable_service factory-reset.service
}
