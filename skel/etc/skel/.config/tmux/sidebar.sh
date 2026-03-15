#!/bin/sh
SIDEBAR_WIDTH='25%'
SIDEBAR_TITLE='TREE_SIDEBAR'

# Identifying current session and window
current_session=$(tmux display-message -p '#{session_id}')
current_window=$(tmux display-message -p '#{window_id}')
option_name="@sidebar_${current_session}_${current_window}"

# Looking for an existing sidebar pane ID
pane_id=$(tmux show-option -gv "$option_name" 2>/dev/null)

if [ -n "$pane_id" ] && tmux list-panes -t "$current_window" -F '#{pane_id}' | grep -qxF "$pane_id"; then
    # Does it exist? Kill it and suppress errors
    tmux kill-pane -t "$pane_id" 2>/dev/null
    tmux set-option -g "$option_name" ""
else
    # Creating a sidebar
    current_pane=$(tmux display-message -p '#{pane_id}')
    current_path=$(tmux display-message -t "$current_pane" -p '#{pane_current_path}')

    # Creating a new left split and running watch.sh
    new_pane=$(tmux split-window -h -b -l "$SIDEBAR_WIDTH" -P -F '#{pane_id}' -d -c "$current_path" \
        ~/.config/tmux/watch.sh "$current_path")

    # Verifying the pane was created and saving its ID
    if [ -n "$new_pane" ]; then
        tmux set-option -g "$option_name" "$new_pane"
        tmux select-pane -t "$new_pane" -T "$SIDEBAR_TITLE"
    fi
fi
