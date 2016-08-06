################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-2016 Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="vulkan-loader"
PKG_VERSION="f93e39d"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="Apache 2.0"
PKG_SITE="https://www.khronos.org"
PKG_URL="https://github.com/KhronosGroup/Vulkan-LoaderAndValidationLayers/archive/$PKG_VERSION.tar.gz"
PKG_SOURCE_DIR="Vulkan-Loader*"
PKG_DEPENDS_TARGET="toolchain cmake:host"
PKG_PRIORITY="optional"
PKG_SECTION="xmedia/depends"
PKG_SHORTDESC="Vulkan Installable Client Driver (ICD) Loader."
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

pre_configure_target() {
  cd ..
  ./update_external_sources.sh
  cd -
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_SYSCONFDIR=/etc \
        -DCMAKE_INSTALL_DATADIR=/share \
        -DCMAKE_SKIP_RPATH=true \
        -DBUILD_WSI_XLIB_SUPPORT=On \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_TESTS=Off \
        -DBUILD_LAYERS=Off \
        -DBUILD_DEMOS=Off \
        -DBUILD_VKJSON=Off \
        $EXTRA_CMAKE_OPTS \
        ..
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib
  cp -rv loader/libvulkan.so* $INSTALL/usr/lib/
  cp -rv loader/libvulkan.so* $SYSROOT_PREFIX/usr/lib/
}
