#!/bin/sh
dir="$1"

# Note: *.bck files are hidden!

# Trapping ctrl+c
trap cleanup INT TERM

# Initial draw
trex -d 3 -c -p | grep -v '.*\.bck'

# Looping forever
while true; do
    # Blocking until a filesystem event occurs in the directory (or subdirectories)
    inotifywait -q -r -e modify -e create -e delete -e move "$dir" >/dev/null 2>&1
    # Cleararing the screen
    clear
    # Redrawing
    trex -d 3 -c -p | grep -v '.*\.bck'
done

