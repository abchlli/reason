```
  ______  ______  ______  ______  ______  __   __
 /\  == \/\  ___\/\  __ \/\  ___\/\  __ \/\ "-.\ \
 \ \  __<\ \  __\\ \  __ \ \___  \ \ \/\ \ \ \-.  \
  \ \_\ \_\ \_____\ \_\ \_\/\_____\ \_____\ \_\\"\_\
   \/_/ /_/\/_____/\/_/\/_/\/_____/\/_____/\/_/ \/_/

          Be mindful during your session <3

```

A low-overhead, minimal and masterable system for programmers.  
The core idea is for it to be masterable within human-time (estimated at about 14 years), excluding the kernel.

# Toolset
* OpenRC ([openrc](https://wiki.gentoo.org/wiki/OpenRC))
* BusyBox ([busybox](https://www.busybox.net))
* File ([file](https://manned.org/man/file))
* Xxd ([xxd](https://manned.org/man/xxd))
* Doas ([doas](https://wiki.gentoo.org/wiki/Doas), doas-sudo-shim)
* Git ([git](https://git-scm.com/docs), [git-lfs](https://git-lfs.com))
* Tmux ([tmux](https://manned.org/man/tmux))
* Skim ([skim](https://manned.org/man/skim))
* Helix([helix](https://helix-editor.com), helix-tree-sitter-vendor)
* OpenSSL ([openssl](https://manned.org/man/openssl))
* OpenSSH ([openssh-client, openssh-keygen](https://www.openssh.org))
* Curl ([curl, trurl](https://curl.se))
* Jq ([jq](https://jqlang.org))
* Strace ([strace](https://manned.org/man/strace))
* Ltrace ([ltrace](https://manned.org/man/ltrace))
* Rizin ([rizin](https://rizin.re))
* Zig ([zig](https://ziglang.org))
* Go ([go](https://go.dev/doc), [go-tools](https://pkg.go.dev/golang.org/x/tools), [gopls](https://go.dev/gopls), [delve](https://github.com/go-delve/delve))
* Python ([python3](https://docs.python.org/3), [uv](https://docs.astral.sh/uv), [ruff](https://docs.astral.sh/ruff), [ty](https://docs.astral.sh/ty))
* SQLite ([sqlite](https://sqlite.org/lang.html))

Refer to the [Alpine](https://www.alpinelinux.org) and [Linux](https://kernel.org) websites for more.

# Installation & usage
1. Import it and boot it up.
```powershell
wsl.exe --import Reason ./Reason reason-rootfs.tar.gz
wsl.exe --distribution Reason
```
2. Create your standard user.
```sh
adduser -h /home/albi -G wheel albi
```
3. Set your preferred DNS servers.
```
echo -e "nameserver 1.1.1.1\nnameserver 1.0.0.1" > /etc/resolv.conf
```

4. Set the time correctly.
```
ln -s /usr/share/zoneinfo/Japan /etc/localtime
```

5. Done! 🎉
```powershell
# You could set something like this as your Windows Terminal profile's command line.
wsl.exe --distribution Reason --user albi
```

# Build
Make sure you have everything required by [alpine-make-rootfs](https://github.com/alpinelinux/alpine-make-rootfs).

```sh
su
git config --global --add safe.directory $PWD
sh build.sh
```

# Tips
* What version of Windows should I use?  
Any version after Windows 10 2004 (build 19041) will do.  
I highly recommend Windows 11 IoT LTSC and running [Win11Debloat](https://github.com/Raphire/Win11Debloat)
post-installation.

* On this version of Windows, the modern Windows Snipping Tool is missing. How do I install it?  
Install `winget` then `winget install 'Snipping Tool'`

* What BusyBox applets are available in the build?
```
 [, [[, addgroup, adduser, ash, base64, basename, bunzip2, bzcat, bzip2, cat, chattr, chgrp, chmod, chown, chpasswd,
        chroot, clear, cmp, cp, cpio, cut, date, dd, delgroup, deluser, df, diff, dirname, dmesg, du, echo, env, expr,
        fallocate, false, find, free, getopt, grep, groups, gunzip, gzip, head, hostname, id, init, install, ip, ipaddr,
        ipcalc, iplink, iproute, kill, last, less, ln, login, ls, lsattr, lsof, mkdir, mkfifo, mknod, mkpasswd, mktemp,
        mount, mountpoint, mv, nc, netstat, nohup, nologin, nproc, od, passwd, patch, pgrep, pidof, ping, ping6, pkill,
        pmap, printf, ps, pwd, readlink, realpath, reset, rev, rm, rmdir, route, sed, seq, sh, shuf, sleep, sort, split,
        ssl_client, stat, strings, stty, su, sulogin, sync, tac, tail, tar, tee, test, time, timeout, touch, tr, traceroute,
        traceroute6, true, tty, udhcpc, udhcpc6, umount, uname, uniq, unxz, unzip, uptime, users, uuidgen, watch, wc,
        wget, which, whoami, whois, xargs, xz, xzcat, zcat
```

* I need Docker!
```sh
su
apk add docker docker-compose
rc-update add containerd default
rc-update add docker default
service containerd start
service docker start
```

* Can I have the `.config/git/config` you use?
```ini
[user]
  email = abchllbox@gmail.com
	name = Alberto Chiaravalli
	signingkey = ~/.ssh/sign.pub
[init]
	defaultBranch = main
[pull]
	ff = only
[commit]
	gpgsign = true
  verbose = true
[gpg]
	format = ssh
[core]
	pager = cat
```

* Can I have a sample `.ssh/config` as well?
```
Host github.com
    User git
    HostName github.com
    IdentityFile ~/.ssh/auth
```

Zig is the system's C/C++ toolchain.  
Shoutout to [Hare](https://harelang.org) and [QBE](https://c9x.me/compile). Incredible work being done there.
