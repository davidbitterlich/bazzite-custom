#!/bin/bash

set -ouex pipefail
: "${IMAGE_VARIANT:?IMAGE_VARIANT is not set}"

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/43/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos
PACKAGES=(
    htop
    screen
    gvfs
    gvfs-fuse
    zsh
    autofs
    git-credential-libsecret
    gvfs
    gvfs-fuse
    igt-gpu-tools
    krb5-workstation
    ksystemlog
    rclone
    qemu
    qemu-kvm
    qemu-img
    qemu-char-spice
    qemu-device-display-virtio-gpu
    qemu-device-display-virtio-vga
    qemu-device-usb-redirect
    qemu-system-x86-core
    qemu-user-binfmt
    qemu-user-static
    p7zip
    p7zip-plugins
    virt-viewer
    podman-compose
    podman-machine
    podman-tui
    podman-docker
    libvirt
    libvirt-nss
    libcamera
    libcamera-tools
    libcamera-qcam
    libcamera-gstreamer
    libcamera-ipa
    pipewire-plugin-libcamera
    virt-manager
    oxygen-icon-theme
    plasma-oxygen
    oxygen-gtk2
)

dnf5 install -y "${PACKAGES[@]}"

#### Example for enabling a System Unit File
case "${IMAGE_VARIANT}" in
    main)
        echo "Building main variant"
        # for now we don't need something special for the main variant
        ;;
    nvidia)
        echo "Building NVIDIA variant"
        # for now we don't need something special for the nvidia variant
        ;;
    surface)
        echo "Building Surface variant"
        /ctx/surface-kernel.sh
        /ctx/finalize-surface.sh
        ;;
esac

systemctl enable podman.socket || true
