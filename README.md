# bazzite-custom

This repository is not much else then current bazzite image with some useful additions (like libvirt) and dedicated builds for systems with NVIDIA GPU and Surface devices (using my own surface kernel packages)

# How to Use

Install bazzite as usual (e. g. download the bazzite-nvidia iso from bazzite.gg) and after the installation, rebase to the image you would like to use:

NVIDIA image:
```bash
rpm-ostree rebase ostree-unverified-registry:ghcr.io/davidbitterlich/bazzite-custom-nvidia:nvidia
```

Surface image:
```bash
rpm-ostree rebase ostree-unverified-registry:ghcr.io/ublue-os/bazzite-custom-surface:surface
```

If you find these images useful, just rebase on them - or fork them and apply your own customizations.