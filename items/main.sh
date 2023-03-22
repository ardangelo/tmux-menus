#!/bin/sh
#
#   Copyright (c) 2022: Jacob.Lundqvist@gmail.com
#   License: MIT
#
#   Part of https://github.com/jaclu/tmux-menus
#
#   Main menu, the one popping up when you hit the trigger
#

# Global check exclude
# shellcheck disable=SC2034,SC2154

# shellcheck disable=SC1007
CURRENT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
SCRIPT_DIR="$(dirname "$CURRENT_DIR")/scripts"

# shellcheck disable=SC1091
. "$SCRIPT_DIR/utils.sh"

menu_name="Main menu"
full_path_this="$CURRENT_DIR/$(basename $0)"
req_win_width=40
req_win_height=22

search_all="command-prompt -p \"Search for:\" \"find-window -CNTiZ -- '%%'\""
open_menu="run-shell '$CURRENT_DIR"

t_start="$(date +'%s')"

# shellcheck disable=SC2154
$TMUX_BIN display-menu \
    -T "#[align=centre] $menu_name " \
    -x "$menu_location_x" -y "$menu_location_y" \
    \
    "Handling Pane      -->" P "$open_menu/panes.sh'" \
    "Handling Window    -->" W "$open_menu/windows.sh'" \
    "Handling Sessions  -->" S "$open_menu/sessions.sh'" \
    "Layouts            -->" L "$open_menu/layouts.sh'" \
    "Split view         -->" V "$open_menu/split_view.sh'" \
    "Extras             -->" E "$open_menu/extras.sh'" \
    "Advanced Options   -->" A "$open_menu/advanced.sh'" \
    "" \
    "toggle status Line" l "set status" \
    "public IP" i "run $SCRIPT_DIR/public_ip.sh" \
    "Plugins inventory" p "run $SCRIPT_DIR/plugins.sh" \
    "" \
    "Navigate & select ses/win/pane" n "choose-tree -Z" \
    "-#[nodim]Search in all sessions & windows" "" "" \
    " ignores case, only visible part" s "$search_all" \
    "" \
    "    Reload configuration file" r "run $SCRIPT_DIR/reload_conf.sh" \
    "<P> Detach from tmux" d detach-client \
    "" \
    "Help  -->" H "$open_menu/help.sh $CURRENT_DIR/main.sh'"

ensure_menu_fits_on_screen
