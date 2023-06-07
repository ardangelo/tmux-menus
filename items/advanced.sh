#!/bin/sh
#
#   Copyright (c) 2022-2023: Jacob.Lundqvist@gmail.com
#   License: MIT
#
#   Part of https://github.com/jaclu/tmux-menus
#
#   Advanced options
#

# Global check exclude
# shellcheck disable=SC2034,SC2154

CURRENT_DIR=$(cd -- "$(dirname -- "$0")" && pwd)
SCRIPT_DIR="$(dirname "$CURRENT_DIR")/scripts"

# shellcheck disable=SC1091
. "$SCRIPT_DIR/dialog_handling.sh"

#
#  Gather some info in order to be able to show states
#
if tmux_vers_compare 2.1; then
    current_mouse_status="$($TMUX_BIN show-option -g mouse | cut -d' ' -f2)"
    if [ "$current_mouse_status" = "on" ]; then
        new_mouse_status="off"
    else
        new_mouse_status="on"
    fi
fi

current_prefix="$($TMUX_BIN show-option -g prefix | cut -d'-' -f2)"

menu_name="Advanced options"

set -- \
    0.0 M Left "Back to Main menu  <--" main.sh \
    2.7 M M "Manage clients     -->" advanced_manage_clients.sh \
    0.0 S \
    0.0 C b "List all key bindings" "list-keys" \
    3.1 C n "List key bindings with notes" "list-keys -N" \
    3.1 C / "<P> Describe (prefix) key" "command-prompt -k \
        -p key 'list-keys -N \"%%%\"'" \
    3.2 C "\~" "<P> Show messages" show-messages \
    3.2 C C "<P> Customize options" "customize-mode -Z" \
    1.8 C : "<P> Prompt for a command" command-prompt \
    0.0 S \
    1.8 C x "Kill server" "confirm-before -p \
        'kill tmux server defined in($TMUX_SOURCE) ? (y/n)' kill-server" \
    0.0 S \
    0.0 M H "Help  -->" "$CURRENT_DIR/help.sh $current_script"

#
#  Disabled until I have time to investigate
#
# plugin_conf_prompt="#{?@menus_config_overrides,Plugin configuration  -->,-Configuration disabled}"
# 0.0 M P "$plugin_conf_prompt" config.sh \

req_win_width=40
req_win_height=14

menu_parse "$@"
