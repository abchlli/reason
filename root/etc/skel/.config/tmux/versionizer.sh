#!/bin/sh
cd "$(tmux run "echo #{pane_start_path}")" || exit 1
url=$(git remote get-url origin 2>/dev/null)
if [ -z "$url" ]; then
    echo "No git remote found."
    exit 1
fi

# Converting SSH to HTTPS
case "$url" in
    git@*)
        url=${url#git@}
        url="https://${url%%:*}/${url#*:}"
        ;;
    ssh://*)
        url=${url#ssh://}
        url=${url#git@}
        host=${url%%/*}
        path=${url#*/}
        url="https://$host/$path"
        ;;
esac

# Removing trailing .git
url=${url%.git}

# Extracting the host
host=${url#https://}
host=${host%%/*}

# Opening the remote in Windows's default browser
case "$host" in
    github.com|gitlab.com|codeberg.org|git.sr.ht)
        '/mnt/c/Windows/System32/cmd.exe' /c start "" "$url"
        ;;
    *)
        echo "Unsupported git host: $host"
        ;;
esac
