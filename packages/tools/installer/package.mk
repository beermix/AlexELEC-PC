################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-2016 Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="installer"
PKG_VERSION="1"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="ttp://www.alexelec.in.ua/"
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain busybox dialog parted e2fsprogs syslinux"
PKG_PRIORITY="optional"
PKG_SECTION="tools"
PKG_SHORTDESC="installer: AlexELEC Install manager"
PKG_LONGDESC="AlexELEC Install manager to install the system on any disk"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

make_target() {
  : # nothing to make here
}

makeinstall_target() {
  : # nothing to install here
}

post_install() {
  mkdir -p $INSTALL/usr/bin
    cp $PKG_DIR/scripts/installer $INSTALL/usr/bin
    sed -e "s/@DISTRONAME@/$DISTRONAME/g" \
        -i  $INSTALL/usr/bin/installer

  mkdir -p $INSTALL/etc
    if [ -f $PROJECT_DIR/$PROJECT/installer/installer.conf ]; then
      cp $PROJECT_DIR/$PROJECT/installer/installer.conf $INSTALL/etc
    else
      cp $PKG_DIR/config/installer.conf $INSTALL/etc
    fi
    sed -e "s/@SYSTEM_SIZE@/$SYSTEM_SIZE/g" \
        -e "s/@SYSTEM_PART_START@/$SYSTEM_PART_START/g" \
        -e "s/@EXTLINUX_PARAMETERS@/$EXTLINUX_PARAMETERS/g" \
        -i $INSTALL/etc/installer.conf

  enable_service installer.service
}
