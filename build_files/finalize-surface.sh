#!/bin/bash

set -euxo pipefail

KVER=$(rpm -q --queryformat="%{VERSION}-%{RELEASE}.%{ARCH}" kernel-surface-core)

export DRACUT_NO_XATTR=1

mkdir -p /var/tmp
chmod 1777 /var/tmp

echo 'add_dracutmodules+=" surface_aggregator_registry surface_aggregator_hub surface_hid_core pinctrl_tigerlake"' > /etc/dracut.conf.d/99-surface-module.conf
sed -i '/\/root/d' /etc/dracut.conf.d/*.conf || true
dracut \
  --no-hostonly \
  --kver "${KVER}" \
  --reproducible \
  -v \
  --add ostree \
  -f "/lib/modules/${KVER}/initramfs.img"

chmod 0600 "/lib/modules/${KVER}/initramfs.img"