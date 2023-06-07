#!/bin/sh

#
#  This script is assumed to have been placed in the items folder of
#  this repo, if not, you will need to change the paths to the support
#  scripts below.
#
CURRENT_DIR=$(cd -- "$(dirname -- "$0")" && pwd)
SCRIPT_DIR="$(dirname "$CURRENT_DIR")/scripts"

# shellcheck disable=SC1091
. "$SCRIPT_DIR/dialog_handling.sh"

active_exe=$(tmux list-panes -F "#{pane_current_command}")

menu_name="$active_exe"
app_menu_path="$(dirname "$CURRENT_DIR")/items/apps/$active_exe.sh"

if [ -f $app_menu_path ]; then
    source $app_menu_path
    menu_parse "$@"

else
    set -- \
        0.0 M Left "Back to Main menu  <==" "main.sh"

    menu_parse "$@"
fi
