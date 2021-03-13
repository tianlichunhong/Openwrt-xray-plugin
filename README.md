xray-plugin for OpenWrt
===

介绍
---
 - [xray-plugin][V]

   Yet another SIP003 plugin for shadowsocks, based on Xray-core


编译
---

 - 从 OpenWrt 的 [SDK][S] 编译

   ```bash
   # 以 ar71xx 平台为例
   tar xJf openwrt-sdk-18.06.1-ar71xx-tiny_gcc-7.3.0_musl.Linux-x86_64.tar.xz
   cd openwrt-sdk-*-ar71xx-*
   # 获取 xray-plugin Makefile
   git clone https://github.com/tianlichunhong/openwrt-xray-plugin.git package/xray-plugin
   # 选择要编译的包 Network -> xray-plugin
   make menuconfig
   # 开始编译
   make package/xray-plugin/compile V=99
   ```


  [S]: https://openwrt.org/docs/guide-developer/using_the_sdk#obtain_the_sdk
  [V]: https://github.com/teddysun/xray-plugin

