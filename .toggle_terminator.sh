#!/bin/bash
# Adrien Vergé, 2013-04-03

cmd="/usr/bin/python /usr/bin/terminator"
tmpfile="/tmp/terminatorf12-lastfocused"

# Check if all needed programs are installed
function checkprogram() {
    which $1 > /dev/null 2>&1 || { echo "error: you need $1"; exit 1; }
}
checkprogram wmctrl
checkprogram xprop

# This function returns the current active window id
function getactivewindow() {
    xprop -root | grep _NET_ACTIVE_WINDOW | head -1 | awk '{print $5}'\
        | sed -e "s/^0x\([0-9a-f]\{7\}\)$/0x0\1/"
}

# List windows
wins=$(wmctrl -lp\
    | sed -e "s/^\(\w\+\)\s\+-\?\w\+\s\+\([0-9]\+\)\s\+.*$/\2,\1/g")

# Try to find terminator among windows
for w in $wins; do
    pid=$(echo $w | cut -d, -f1) # PID
    wid=$(echo $w | cut -d, -f2) # Window id
    prog=$(ps ho cmd $pid)
    if [ "$prog" = "$cmd" ]; then # Terminator is already running
        # If it's not focused: give it focus
        if [ "$wid" != "$(getactivewindow)" ]; then
            # ... but before, save the id of current focused window
            echo -n $(getactivewindow) > "$tmpfile"
            wmctrl -ia $wid
        # Else, give focus to last program
        else
            if [ -f "$tmpfile" ]; then
                wmctrl -ia $(cat "$tmpfile")
            fi
        fi
        exit 0
    fi
done

# Terminator has not been found: launch it
# ... but before, save the id of current focused window
echo -n $(getactivewindow) > "$tmpfile"
$cmd &

exit 0
