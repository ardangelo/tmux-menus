#!/bin/sh
#
#   Copyright (c) 2022: Jacob.Lundqvist@gmail.com
#   License: MIT
#
#   Part of https://github.com/jaclu/tmux-menus
#
#   Version: 1.2.6 2022-04-08
#
#   Main menu, the one popping up when you hit the trigger
#
#   Types of menu item lines.
#
#   1) An item leading to an action
#          "Description" "In-menu key" "Action taken when it is triggered"
#
#   2) Just a line of text
#      You must supply two empty strings, in order for the
#      menu logic to interpret it as a full menu line item.
#          "Some text to display" "" ""
#
#   3) Separator line
#      This is a proper graphical separator line, without any label.
#          ""
#
#   4) Labeled separator line
#      Not perfect, since you will have at least one space on each side of
#      the labeled separator line, but using something like this and carefully
#      increase the dashes until you are just below forcing the menu to just
#      grow wider, seems to be as close as it gets.
#          "#[align=centre]-----  Other stuff  -----" "" ""
#
#
#   All but the last line in the menu, needs to end with a continuation \
#   White space after this \ will cause the menu to fail!
#   For any field containing no spaces, quotes are optional.
#

# shellcheck disable=SC1007
CURRENT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
SCRIPT_DIR="$(dirname "$CURRENT_DIR")/scripts"

# shellcheck disable=SC1091
. "$SCRIPT_DIR/utils.sh"


# shellcheck disable=SC2154
tmux display-menu \
     -T "#[align=centre] Main menu "              \
     -x "$menu_location_x" -y "$menu_location_y"  \
     \
     "    Handling Pane      -->"  P  "run-shell $CURRENT_DIR/panes.sh"       \
     "    Handling Window    -->"  W  "run-shell $CURRENT_DIR/windows.sh"     \
     "    Handling Sessions  -->"  S  "run-shell $CURRENT_DIR/sessions.sh"    \
     "    Layouts            -->"  L  "run-shell $CURRENT_DIR/layouts.sh"     \
     "    Split view         -->"  V  "run-shell $CURRENT_DIR/split_view.sh"  \
     "    Advanced Options   -->"  A  "run-shell $CURRENT_DIR/advanced.sh"    \
     "" \
     "<P> List all key bindings"        \?  "list-keys -N"  \
     "    Reload configuration file" "r" "run-shell 'tmux source-file ~/.tmux.conf; tmux display-message \"Sourced ~/.tmux.conf\"'"  \
     "" \
     "    Search in all sessions and" "" "" \
     "    windows, ignores case," "" "" \
     "    only visible part"     s  "command-prompt -p \"Search for:\" \"find-window -CNTiZ -- '%%'\"" \
     "" \
     "    Navigate & select ses/win/pane " ""  ""  \
     "<P> use arrows to navigate & zoom  " n   "choose-tree -Zs"  \
     "" \
     "    (Used by Pane and Windows menu)"  "" ""  \
     "<P> #{?pane_marked,Unmark,Mark} current pane" m  "select-pane -m"  \
     "" \
     "<P> Detach from tmux"  d  detach-client      \
     "" \
     "Help  -->"  H  "run-shell \"$CURRENT_DIR/help.sh $CURRENT_DIR/main.sh\""

#  Help needs an additional param to tell it where to go back, resulting in the need for this run-shell instance's parameters to be enclosed
#  in an additional level of "" to make both parameters to be seen as the one expected param to run-shell
