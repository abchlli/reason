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
* Musl ([documentation](https://musl.libc.org/about.html), [source](https://git.musl-libc.org/cgit/musl))
* BusyBox ([documentation](https://busybox.net/), [source](https://git.busybox.net/busybox), [manual](https://manned.org/man/busybox))
* OpenRC ([documentation](https://wiki.alpinelinux.org/wiki/OpenRC), [source](https://github.com/OpenRC/openrc))
* OpenSSL ([source](https://github.com/openssl/openssl), [manual](https://manned.org/man/openssl))
* OpenSSH ([documentation](https://www.openssh.org), [manual](https://manned.org/man/ssh), [source](https://github.com/openssh/openssh-portable))
* OpenDoas ([source](https://github.com/Duncaen/OpenDoas), [manual](https://manned.org/man/doas))
* File ([source](https://astron.com/pub/file), [manual](https://manned.org/man/file))
* Xxd ([source](https://github.com/vim/vim/tree/master/src/xxd), [manual](https://manned.org/man/xxd))
* Curl ([documentation](https://curl.se/docs/tutorial.html), [source](https://github.com/curl/curl), [manual](https://manned.org/man/curl))
* Jq ([documentation](https://jqlang.org), [source](https://github.com/jqlang/jq), [manual](https://manned.org/man/jq))
* Git ([documentation](https://git-scm.com/book/en/v2), [source](https://github.com/git/git), [manual](https://manned.org/man/git))
* Jujutsu ([documentation](https://www.jj-vcs.dev/latest), [source](https://github.com/jj-vcs/jj), [manual](https://manned.org/man/jj))
* Tmux ([source](https://github.com/tmux/tmux), [manual](https://manned.org/man/tmux))
* Skim ([source](https://github.com/skim-rs/skim), [manual](https://manned.org/man/skim))
* Helix ([documentation](https://helix-editor.com), [source](https://github.com/helix-editor/helix), [manual](https://manned.org/man/helix))
* Oxide ([documentation](https://oxide.md/index), [source](https://github.com/Feel-ix-343/markdown-oxide))
* Typst ([ducumentation](https://typst.app/docs), [source](https://github.com/typst/typst), [manual](https://manned.org/man/typst))
* TinyCC ([documentation](https://bellard.org/tcc/tcc-doc.html), [source](https://repo.or.cz/w/tinycc.git), [manual](https://manned.org/man/tcc))
* Strace ([source](https://github.com/strace/strace), [manual](https://manned.org/man/strace))
* Ltrace ([source](https://gitlab.com/cespedes/ltrace), [manual](https://manned.org/man/ltrace))
* Rizin ([documentation](https://rizin.re), [source](https://github.com/rizinorg/rizin), [manual](https://manned.org/man/rizin))
* Go ([documentation](https://go.dev/doc), [source](https://github.com/golang/go))
* Delve ([source](https://github.com/go-delve/delve), [manual](https://manned.org/man/dlv))
* CPython ([documentation](https://docs.python.org/3), [source](https://github.com/python/cpython), [manual](https://manned.org/man/python))
* SQLite ([documentation](https://sqlite.org), [source](https://github.com/sqlite/sqlite), [manual](https://manned.org/man/sqlite))

Here are the [C99](https://www.open-std.org/JTC1/SC22/WG14/www/projects.html) (N1256), [Go](https://go.dev/ref/spec) and [CPython](https://docs.python.org/3/reference/index.html) specifications.  
Refer to the [Alpine](https://www.alpinelinux.org) and [Linux](https://kernel.org) websites for more.

> [!NOTE]
> The links in this section are always gonna be up to date and pointing to the *actual* thing to read.

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

4. Done! 🎉

You could set something like this as your Windows Terminal profile's command line.
```powershell
wsl.exe --distribution Reason --user albi
```

# Build
Make sure you have everything required by [alpine-make-rootfs](https://github.com/alpinelinux/alpine-make-rootfs).
```sh
su
git config --global --add safe.directory $(pwd)
sh build.sh
```

# Questions & answers
* What version of Windows should I use?  
Any version after Windows 10 2004 (build 19041) will do.  
I highly recommend Windows 11 IoT LTSC, run [Win11Debloat](https://github.com/Raphire/Win11Debloat) post-installation.

* On this version of Windows, the modern Windows Snipping Tool is missing. How do I install it?  
Install `winget` then `winget install 'Snipping Tool'`, don't forget to uninstall `winget` if you don't want it!

* What BusyBox applets are available in the build?
```
Currently defined functions:
        [, [[, addgroup, adduser, ash, base64, basename, bunzip2, bzcat, bzip2, cat, chattr, chgrp, chmod, chown, chpasswd, chroot, clear, cmp, cp, cpio, cut, date, dd, delgroup, deluser,
        df, diff, dirname, du, echo, env, expr, fallocate, false, find, free, getopt, grep, groups, gunzip, gzip, head, hostname, id, init, install, ip, ipaddr, ipcalc, iplink, iproute,
        kill, last, less, ln, ls, lsattr, lsof, mkdir, mkfifo, mknod, mktemp, mount, mountpoint, mv, nc, netstat, nohup, nproc, od, passwd, patch, pgrep, pidof, ping, ping6, pkill, pmap,
        printf, ps, pwd, readlink, realpath, reset, rev, rm, rmdir, route, sed, seq, sh, shuf, sleep, sort, split, stat, strings, stty, su, sync, tac, tail, tar, tee, test, time, timeout,
        touch, tr, traceroute, traceroute6, true, tty, umount, uname, uniq, unxz, unzip, uptime, users, uuidgen, watch, wc, wget, which, whoami, whois, xargs, xz, xzcat, zcat
```
The build is made for WSL allowing it to have a smaller selection of applets, it favors performance over binary size.

* How do I get Docker running?
```sh
su
apk add docker docker-compose
rc-update add containerd default
rc-update add docker default
rc-service containerd start
rc-service docker start
```

* Can I have a the `.config/git/config` you use?
```ini
[core]
	pager = cat
[init]
	defaultBranch = main
[pull]
	ff = only
[gpg]
	format = ssh
[commit]
	gpgsign = true
	verbose = true
[user]
	email = abchllbox@gmail.com
	name = Alberto Chiaravalli
	signingkey = ~/.ssh/sign.pub
```

* Can I have a sample `.ssh/config` as well?
```
Host github.com
    User git
    HostName github.com
    IdentityFile ~/.ssh/auth
```

The system uses readline and helix bindings everywhere, enjoy!
