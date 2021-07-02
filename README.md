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
  - `error-to-console`: Logs JavaScript errors to the service log instead of the console, useful for remote debugging (check the logs with `snap logs wpe-webkit-mir-kiosk.browser`)
  - `debug`: Enables (very) verbose debug messaging by setting `G_MESSAGES_DEBUG=all`, `LIBGL_DEBUG=verbose` and `WAYLAND_DEBUG=1`. Useful only if the browser won't start at all or has critical rendering issues, as this will definitely spam your logs.
- Browsing works with [auto-connected interfaces](https://docs.snapcraft.io/interface-management/6154)
- Ships manually connected interfaces for advanced use (Bonjour/zeroconf etc.)
- Exposes the `com.igalia.Cog` D-Bus service on the **system** bus. This allows snaps that plug this interface to remote-control the Cog browser with all commands that upstream `cogctl` [currently provides](https://github.com/Igalia/cog/blob/31d9d6a77717c4f4686f915f6df441f8dfcb2fba/cogctl.c#L256). See [snapcraft docs](https://snapcraft.io/docs/dbus-interface) for more information.

## Components

- [WPE WebKit](https://wpewebkit.org) and its direct dependencies:
  - `libwpe`
  - [WPE FDO backend](https://github.com/Igalia/WPEBackend-fdo)
- [Cog](https://github.com/Igalia/cog) launcher/webapp container

## Enable Hardware Acceleration

- Install mesa-core20 snap from snap store
  - `snap install mesa-core20` 
  - For upstream supported graphics
    - `snap connect wpe-webkit-mir-kiosk:graphics-core20 mesa-core20:graphics-core20`
  - For specific hardware platform
    - `snap connect wpe-webkit-mir-kiosk:graphics-core20 mesa-core20:graphics-core20`
    - `snap connect wpe-webkit-mir-kiosk:graphics-core20 vendor-mesa-core20:graphcis-core20`
