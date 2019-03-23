# WPE WebKit Snap for Mir in kiosk mode

The [WPE fork of WebKit](https://wpewebkit.org), packaged as a snap for fullscreen use in kiosk applications.

Tested on:

- ✅ Ubuntu Desktop 18.04.02 LTS with weston/miral-kiosk
- ✅ Ubuntu Core with [mir-kiosk](https://snapcraft.io/mir-kiosk) on a Raspberry Pi 3

The snap should run on [all snapd-supported distributions](https://docs.snapcraft.io/installing-snapd/6735) if you have a Wayland compositor running with the default socket at `/run/user/0/wayland-0` (currently hardcoded, cf. [this post](https://forum.snapcraft.io/t/cross-post-chromium-mir-kiosk-in-portrait-mode-rotated-mir-kiosk-layout/8175/11) on the snapcraft forum for details)

## Features

- Fullscreen webview for any size or rotation passed by the Wayland compositor
- [Configurable](https://docs.snapcraft.io/configuration-in-snaps/510):
  - `url`: Accepts HTTP(S) URLs
  - `devmode`: Toggle Remote Inspector on/off
- Browsing works with [auto-connected interfaces](https://docs.snapcraft.io/interface-management/6154)
- Ships manually connected interfaces for advanced use (Bonjour/zeroconf etc.)

## Components

- [WPE WebKit](https://wpewebkit.org) and its direct dependencies:
  - `libwpe`
  - [WPE FDO backend](https://github.com/Igalia/WPEBackend-fdo)
- [Cog](https://github.com/Igalia/cog) launcher/webapp container
