#!/bin/sh

# Dependencies
apk add make gcc linux-headers go

# Submodules
until git submodule update --init --recursive; do sleep 10; done

# Busybox
cp busybox.config busybox/.config ; cd busybox/ ; make
cp ./busybox ../root/usr/local/bin/box; cd ..

# Trex
cd trex; CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -trimpath -ldflags='-s -w -extldflags="-static"' -o build/trex_linux_amd64 trex.go
cp ./build/trex_linux_amd64 ../root/usr/local/bin/trex; cd ..

# Go
wget "https://dl.google.com/go/$(curl https://go.dev/VERSION?m=text | head -n1).linux-amd64.tar.gz" \
&& tar -C root/usr/local -xzf go*.linux-amd64.tar.gz
rm go*.linux-amd64.tar.gz

# Toolset
toolset="
apk-tools
busybox
busybox-openrc
openrc
tzdata
openssl
ca-certificates
openssh-client
openssh-keygen
doas
doas-sudo-shim
file
xxd
curl
jq
git
jujutsu
tmux
skim
inotify-tools
helix
helix-tree-sitter-vendor
markdown-oxide
typst
tinymist
tcc
tcc-libs-static
musl-dev
strace
ltrace
rizin
go-tools
gopls
delve
python3
uv
ruff
ty
sqlite
"

# Rootfs
./alpine-make-rootfs \
    --repositories-file ./repositories \
    --packages "$toolset" \
    --fs-skel-dir ./root \
    --script-chroot reason-rootfs.tar.gz ./chroot.sh

# Cleanup
apk add make gcc linux-headers go
