################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-2016 Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="alsa-utils"
PKG_VERSION="1.1.1"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://www.alsa-project.org/"
PKG_URL="ftp://ftp.alsa-project.org/pub/utils/$PKG_NAME-$PKG_VERSION.tar.bz2"
PKG_DEPENDS_TARGET="toolchain alsa-lib"
PKG_PRIORITY="optional"
PKG_SECTION="audio"
PKG_SHORTDESC="alsa-utils: Advanced Linux Sound Architecture utilities"
PKG_LONGDESC="This package includes the utilities for ALSA, like alsamixer, aplay, arecord, alsactl, iecset and speaker-test."
PKG_IS_ADDON="no"
PKG_AUTORECONF="yes"

# package specific configure options
PKG_CONFIGURE_OPTS_TARGET="--disable-dependency-tracking \
                           --disable-xmlto \
                           --enable-alsamixer \
                           --disable-alsaconf \
                           --disable-alsaloop \
                           --enable-alsatest \
                           --disable-bat \
                           --disable-nls"


post_makeinstall_target() {
  rm -rf $INSTALL/lib $INSTALL/var
  rm -rf $INSTALL/usr/lib/systemd/system

# remove default udev rule to restore mixer configs, we install our own.
# so we avoid resetting our soundconfig
  rm -rf $INSTALL/usr/lib/udev/rules.d/90-alsa-restore.rules

  for i in aconnect alsaucm amidi aplaymidi arecord arecordmidi aseqdump aseqnet iecset; do
    rm -rf $INSTALL/usr/bin/$i
  done

  mkdir -p $INSTALL/usr/lib/udev
    cp $PKG_DIR/scripts/soundconfig $INSTALL/usr/lib/udev
}
