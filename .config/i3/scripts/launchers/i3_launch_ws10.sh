#!/bin/sh

WSNUM='10'
WSNAME='School'

# ----------------------

sanitize_input() {
   local s="${1?need a string}"   # receive input in first argument
   s="${s//[^[:alnum:]]/-}"       # replace all non-alnum characters to -
   s="${s//+(-)/-}"               # convert multiple - to single -
   s="${s/#-}"                    # remove - from start
   s="${s/%-}"                    # remove - from end
   VARSANITIZED="${s,,}"          # convert to lowercase
}

set_layout() {
    local WSLAYOUT="/home/fclaude/.config/i3/workspaces/workspace_$1_$2.json"
    local WSTITLE="$1:${2^}"

    if [ -f "$WSLAYOUT" ]; then
        /usr/bin/i3-msg "workspace $WSTITLE; append_layout $WSLAYOUT"
        /usr/bin/sleep 0.5
    fi
}

# sanitize num
sanitize_input "$WSNUM" && WSNUM=$VARSANITIZED

# sanitize name
sanitize_input "$WSNAME" && WSNAME=$VARSANITIZED

# ----------------------

# set_layout (ws num, ws name)
set_layout "$WSNUM" "$WSNAME"

# launch zoom
#/usr/bin/i3-msg "workspace $WSNUM:${WSNAME^}; \
#
#                exec --no-startup-id \
#                /usr/bin/zoom"
#
#/usr/bin/sleep 0.5


# launch vs-code
#/usr/bin/i3-msg "workspace $WSNUM:${WSNAME^}; \
#
#                exec --no-startup-id \
#                /usr/bin/code-oss \
#                    --new-window"
#
#/usr/bin/sleep 0.5
