#!/bin/sh
#
#   Copyright (c) 2022-2023: Jacob.Lundqvist@gmail.com
#   License: MIT
#
#   Part of https://github.com/jaclu/tmux-menus
#
#   Select and modify paste buffers
#

#  shellcheck disable=SC2034
#  Directives for shellcheck directly after bang path are global

CURRENT_DIR=$(cd -- "$(dirname -- "$0")" && pwd)
SCRIPT_DIR="$(dirname "$CURRENT_DIR")/scripts"

# shellcheck disable=SC1091
. "$SCRIPT_DIR/dialog_handling.sh"

menu_name="Paste buffers"

#  shellcheck disable=SC2154
set -- \
    2.0 M Left "Back to Main menu      <==" main.sh \
    2.0 T "-#[nodim]Enter - Paste selected buffer" \
    2.0 T "-#[nodim]Up    - Select previous buffer" \
    2.0 T "-#[nodim]Down  - Select next buffer" \
    2.0 T "-#[nodim]C-s   - Search by name or content" \
    2.0 T "-#[nodim]n     Repeat last search" \
    2.0 T "-#[nodim]p     Paste selected buffer" \
    2.0 T "-#[nodim]d     Delete selected buffer" \
    2.0 T "-#[nodim]e     Open the buffer in an editor" \
    2.0 T "-#[nodim]v     Toggle preview" \
    2.0 T "-#[nodim]q     Exit mode" \
    1.9 C = "<P>" "choose-buffer" \
    2.0 M H "Help  -->" "$CURRENT_DIR/help.sh $current_script"

req_win_width=41
req_win_height=15

menu_parse "$@"
