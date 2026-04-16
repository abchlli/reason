```
  ______  ______  ______  ______  ______  __   __
 /\  == \/\  ___\/\  __ \/\  ___\/\  __ \/\ "-.\ \
 \ \  __<\ \  __\\ \  __ \ \___  \ \ \/\ \ \ \-.  \
  \ \_\ \_\ \_____\ \_\ \_\/\_____\ \_____\ \_\\"\_\
   \/_/ /_/\/_____/\/_/\/_/\/_____/\/_____/\/_/ \/_/

          Be mindful during your session <3

```

A low-overhead, minimal and masterable system for programmers.  
The core idea is for complete understanding of it to be achivable in human-time.  
This includes the languages specifications and all the source code (estimated at ~8 years).

# Toolset
What is pre-installed?
* Musl ([learn](https://musl.libc.org/about.html), [manual](https://manned.org/man/libc), [source](https://git.musl-libc.org/cgit/musl))
* BusyBox ([learn](https://busybox.net/FAQ.html), [manual](https://manned.org/man/busybox), [source](https://git.busybox.net/busybox))
* OpenSSH ([learn](https://www.openssh.org), [manual](https://manned.org/man/ssh), [source](https://github.com/openssh/openssh-portable))
* Doas ([manual](https://manned.org/man/doas), [source](https://github.com/Duncaen/OpenDoas))
* File ([manual](https://manned.org/man/file), [source](https://astron.com/pub/file))
* Xxd ([manual](https://manned.org/man/xxd), [source](https://github.com/vim/vim/tree/master/src/xxd))
* Jq ([learn](https://jqlang.org/tutorial), [manual](https://manned.org/man/jq), [source](https://github.com/jqlang/jq))
* Git ([learn](https://git-scm.com/book/en/v2), [manual](https://manned.org/man/git), [source](https://github.com/git/git))
* Jujutsu ([learn](https://www.jj-vcs.dev/latest), [manual](https://manned.org/man/jj), [source](https://github.com/jj-vcs/jj))
* Tmux ([manual](https://manned.org/man/tmux), [source](https://github.com/tmux/tmux))
* Skim ([manual](https://manned.org/man/skim), [source](https://github.com/skim-rs/skim))
* Helix ([learn](https://helix-editor.com), [manual](https://manned.org/man/helix), [source](https://github.com/helix-editor/helix))
* Oxide ([learn](https://oxide.md/index), [source](https://github.com/Feel-ix-343/markdown-oxide)
* TinyCC ([learn](https://bellard.org/tcc/tcc-doc.html), [manual](https://manned.org/man/tcc), [source](https://repo.or.cz/w/tinycc.git))
* Strace ([manual](https://manned.org/man/strace), [source](https://github.com/strace/strace))
* Ltrace ([manual](https://manned.org/man/ltrace), [source](https://gitlab.com/cespedes/ltrace))
* Rizin ([learn](https://rizin.re), [manual](https://manned.org/man/rizin), [source](https://github.com/rizinorg/rizin))
* SQLite ([learn](https://sqlite.org), [manual](https://manned.org/man/sqlite), [source](https://github.com/sqlite/sqlite))

Addtionally, here's the [C99](https://www.open-std.org/JTC1/SC22/WG14/www/projects.html) (N1256) specification.  
Refer to the [Alpine](https://www.alpinelinux.org) and [Linux](https://kernel.org) websites for more.

> [!NOTE]
> The links in this section are always up-to-date and point to the *actual* thing to read.

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
wsl.exe --distribution Reason --user albi --cd ~/
```

This is a good time to install the programming language (s) and whatnot.  

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
Install `winget` then run `winget install 'Snipping Tool'`.

* What BusyBox applets are available in the build?
```
Currently defined functions:
        [, [[, addgroup, adduser, ash, base64, basename, bunzip2, bzcat, bzip2, cat, chattr, chgrp, chmod, chown, chpasswd, chroot, clear,
        cmp, cp, cpio, cut, date, dd, delgroup, deluser, df, diff, dirname, du, echo, env, expr, fallocate, false, find, free, getopt, grep,
        groups, gunzip, gzip, head, hostname, id, init, install, ip, ipaddr, ipcalc, iplink, iproute, kill, last, less, ln, ls, lsattr,
        lsof, mkdir, mkfifo, mknod, mktemp, mount, mountpoint, mv, nc, netstat, nohup, nproc, od, passwd, patch, pgrep, pidof, ping, ping6,
        pkill, pmap, printf, ps, pwd, readlink, realpath, reset, rev, rm, rmdir, route, sed, seq, sh, shuf, sleep, sort, split, stat,
        strings, stty, su, sync, tac, tail, tar, tee, test, time, timeout, touch, tr, traceroute, traceroute6, true, tty, umount, uname,
        uniq, unxz, unzip, uptime, users, uuidgen, watch, wc, wget, which, whoami, whois, xargs, xz, xzcat, zcat
```
The build is made for WSL allowing for a smaller selection of applets (performance over binary size).

* How do I get Docker running?
```sh
su
apk add docker docker-compose
rc-update add containerd default
rc-update add docker default
rc-service containerd start
rc-service docker start
```

* Can I a sample `~/.config/git/config`?
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
	signingkey = ~/.ssh/sign.pub
	email = abchllbox@gmail.com
	name = Alberto Chiaravalli
```

* Can I have a sample `~/.config/jj/config.toml` too?
```toml
#:schema https://jj-vcs.github.io/jj/latest/config-schema.json

[ui]
pager = "cat"

[signing]
behavior = "own"
backend = "ssh"
key = "~/.ssh/sign.pub"

[user]
email = "abchllbox@gmail.com"
name = "Alberto Chiaravalli"
```

* Can I have a sample `~/.ssh/config` pleaaaase?
```
Host github.com
    User git
    HostName github.com
    IdentityFile ~/.ssh/auth
```

* Why is there no curl?  
Curl supports a lot more then just HTTP(1/2/3), it felt redundant.  
I find myself using the graphical [HTTPie](https://httpie.io) client most of the time instead.  
For that one time you want to copy-paste a command you can use this included BusyBox alias.
```sh
alias curl="wget -q -U 'User-Agent: curl/8.17/0' -O -"
```

* OpenSSL's codebase is huge, unreadable and bad.  
There are some alternative to it (namely LibreSSL and BearSSL), but it's non-trivial to switch.

You might wanna set this to disable [wslg](https://github.com/microsoft/wslg) in `"$env:USERPROFILE\.wslconfig"`.
```ini
[wsl2]
guiApplications=false
```

The system uses readline and helix style keybinds everywhere.  
You might wanna import the highly curated [bookmarks](./additional/firefox/bookmarks.html), enjoy!
