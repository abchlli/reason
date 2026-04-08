#!/bin/sh

# Dependencies
apk add curl make gawk gcc linux-headers go

# Busybox
until git submodule update --init --recursive; do sleep 10; done
cp busybox.config busybox/.config ; cd busybox/ ; make
cp ./busybox ../root/usr/local/bin/box; cd ..

# Toolset
toolset="
musl-dev
apk-tools 
openrc
busybox 
busybox-openrc
tzdata
openssl 
ca-certificates
openssh-client 
openssh-keygen
doas 
doas-sudo-shim
file 
xxd
jq
git 
jujutsu
tmux
skim
helix 
helix-tree-sitter-vendor
markdown-oxide
tcc
tcc-libs-static
strace
ltrace
rizin
typst
tinymist
sqlite
"

# Rootfs
./alpine-make-rootfs \
    --repositories-file ./repositories \
    --packages "$toolset" \
    --fs-skel-dir ./root \
    --script-chroot reason-rootfs.tar.gz ./chroot.sh

# Cleanup
apk del curl make gawk gcc linux-headers go
