#!/bin/sh
#
#   Copyright (c) 2022-2023: Jacob.Lundqvist@gmail.com
#   License: MIT
#
#   Part of https://github.com/jaclu/tmux-menus
#
#   Main menu, the one popping up when you hit the trigger
#

# Global check exclude
# shellcheck disable=SC2034,SC2154

CURRENT_DIR=$(cd -- "$(dirname -- "$0")" && pwd)
SCRIPT_DIR="$(dirname "$CURRENT_DIR")/scripts"

# shellcheck disable=SC1091
. "$SCRIPT_DIR/dialog_handling.sh"

menu_name="Main menu"

# 1.6 C s " only visible part" "command-prompt \
#     -p 'Search for:' 'find-window -CNTZ"

set -- \
    0.0 M a "Application Menu  -->" app_menu.sh \
    0.0 M p "Handling Pane     -->" panes.sh \
    0.0 M w "Handling Window   -->" windows.sh \
    0.0 M l "Layouts           -->" layouts.sh \
    0.0 M v "Split view        -->" split_view.sh \
    0.0 M d "Advanced Options  -->" advanced.sh \
    0.0 S \
    0.0 C n "Navigate & select ses/win/pane" "choose-tree"
    0.0 C d '<P> Detach from tmux' detach-client \
    0.0 S \
    0.0 M H 'Help       -->' "$CURRENT_DIR/help.sh $current_script"

# tmux 3.2+ crops text to make dialogs fit in tighter spaces
req_win_width=40
req_win_height=11

menu_parse "$@"
