#!/bin/bash

XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-~/.config}

# Allow users to override command-line options
if [[ -f $XDG_CONFIG_HOME/roansbrowser-flags.conf ]]; then
   ROANSBROWSER_USER_FLAGS="$(cat $XDG_CONFIG_HOME/roansbrowser-flags.conf)"
fi

# Launch
exec /opt/chromium.org/roansbrowser/roansbrowser $ROANSBROWSER_USER_FLAGS "$@"
