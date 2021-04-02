#
# Copyright (C) 2018-2021 honwen <https://github.com/tianlichunhong>
#
# This is free software, licensed under the GNU General Public License v3.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=xray-plugin
PKG_VERSION:=1.4.2
PKG_RELEASE:=20210402
PKG_MAINTAINER:=tianlichunhong <https://github.com/tianlichunhong>

# OpenWrt ARCH: arm, i386, x86_64, mips, mipsel
# Golang ARCH: arm[5-7], 386, amd64, mips, mipsle
PKG_ARCH:=$(ARCH)
BIN_ARCH:=$(ARCH)
ifeq ($(ARCH),mips)
	BIN_ARCH:=mips_sf
endif
ifeq ($(ARCH),mipsel)
	PKG_ARCH:=mips
	BIN_ARCH:=mipsle_sf
endif
ifeq ($(ARCH),i386)
	PKG_ARCH:=386
	BIN_ARCH:=386
endif
ifeq ($(ARCH),x86_64)
	PKG_ARCH:=amd64
	BIN_ARCH:=amd64
endif
ifeq ($(ARCH),aarch64)
	PKG_ARCH:=arm64
	BIN_ARCH:=arm64
endif
ifeq ($(ARCH),arm)
	BIN_ARCH:=arm7
endif

PKG_SOURCE:=xray-plugin-linux-$(PKG_ARCH)-v$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://github.com/teddysun/xray-plugin/releases/download/v$(PKG_VERSION)/
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_HASH:=skip

include $(INCLUDE_DIR)/package.mk

define Package/xray-plugin
	SECTION:=net
	CATEGORY:=Network
	TITLE:=SIP003 plugin for shadowsocks, based on xray
	URL:=https://github.com/teddysun/xray-plugin
endef

define Package/xray-plugin/description
	Yet another SIP003 plugin for shadowsocks, based on xray
endef

define Build/Prepare
	gzip -dc "$(DL_DIR)/$(PKG_SOURCE)" | tar -C $(PKG_BUILD_DIR)/ -xf -
endef

define Build/Compile
	echo "$(PKG_NAME)Compile Skipped!"
endef

define Package/xray-plugin/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/xray-plugin_linux_$(BIN_ARCH) $(1)/usr/bin/xray-plugin
endef

$(eval $(call BuildPackage,xray-plugin))
