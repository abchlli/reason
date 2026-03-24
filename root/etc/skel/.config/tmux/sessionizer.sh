#!/bin/sh

# Lookup
HOME_DIR="${HOME:-}"
DIRS="$HOME_DIR $HOME_DIR/code/* $HOME_DIR/.config"

# This uses skim, but any other fuzzy finder will do
if [ $# -eq 1 ]; then
    selected="$1"
else
    selected=$(
        {
            echo $USER
            for dir in $DIRS; do
                find "$dir" -type d -maxdepth 1 ! -path "$dir" ! -name ".*" 2>/dev/null
            done
        } | sed -e "s|$HOME_DIR/||" -e 's|/$||' \
          | sk --margin 10% --color="bw"
    )
fi

[ -z "$selected" ] && exit 0

# Extracting the basename to use it as the session name
if [ "$selected" = $USER ]; then
    raw_name=$USER
    path="$HOME_DIR"
else
    raw_name=$(basename "$selected")
    path="$HOME_DIR/$selected"
fi

# Converting dots to underscores
name=$(echo "$raw_name" | tr '.' '_')

# Does the selected session exist?
if ! tmux has-session -t "=$name" 2>/dev/null; then
    tmux new-session -ds "$name" -c "$path"
    tmux select-window -t "$name:1"
fi

# Switching to the selected session
if [ -n "$TMUX" ]; then
    tmux switch-client -t "=$name"
else
    tmux attach-session -t "=$name"
fi
