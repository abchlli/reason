#!/bin/sh

# Installing Reason's Busybox
# apk del busybox
mv /bin/box /bin/busybox
/bin/busybox --install -s /bin
apk fix busybox-suid

# Removing Helix default themes
rm -rf /usr/share/helix/runtime/themes
