#!/bin/sh

# Requirements
apk add gcc make gawk groff linux-headers

# BusyBox
until git submodule update --init --recursive; do sleep 10; done
cp busybox.config busybox/.config ; cd busybox/ ; make ; cp ./busybox ../skel/bin/box; cd ..

# Go
wget "https://dl.google.com/go/$(curl https://go.dev/VERSION?m=text | head -n1).linux-amd64.tar.gz" \
&& tar -C skel/usr/local -xzf go*.linux-amd64.tar.gz
rm go*.linux-amd64.tar.gz

# Toolset
toolset="
apk-tools
busybox
busybox-suid
file
xxd
openrc
doas
doas-sudo-shim
ca-certificates
openssl
openssh-client
openssh-keygen
curl
trurl
jq
git
git-lfs
tmux
skim
helix
helix-tree-sitter-vendor
strace
ltrace
rizin
musl-dev
zig
go-tools
gopls
delve
python3
uv
ruff
ty
sqlite
"

./alpine-make-rootfs \
    --repositories-file ./repositories \
    --packages "$toolset" \
    --fs-skel-dir ./skel \
    --script-chroot reason-rootfs.tar.gz ./chroot.sh
 
# Clean
apk del gcc make groff linux-headers
