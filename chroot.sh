#!/bin/sh

# Installing Reason's BusyBox build
mv /usr/local/bin/box /bin/busybox

# Removing all Busybox symlinks
applets=$(busybox --list)
busybox find /bin /usr/bin -type l -exec busybox sh -c '
    link="$1"
    target=$(busybox readlink "$link")
    case "$target" in
        *busybox)
            name=$(busybox basename "$link")
            case "$name" in
                sh|busybox) exit 0 ;;
            esac
            if ! busybox echo "$applets" | busybox grep -Fxq "$name"; then
                busybox rm -f "$link"
            fi
            ;;
    esac
' busybox-sh {} \;

# Relinking Busybox
busybox --install -s

# Setting the Busybox SUID
chmod 4755 /bin/busybox

# Removing Helix default themes
rm -rf /usr/share/helix/runtime/themes
