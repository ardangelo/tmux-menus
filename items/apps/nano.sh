#!/bin/sh
CURRENT_DIR=$(cd -- "$(dirname -- "$0")" && pwd)
SCRIPT_DIR="$(dirname "$CURRENT_DIR")/scripts"

# shellcheck disable=SC1091
. "$SCRIPT_DIR/dialog_handling.sh"

set -- \
    0.0 M Left "Back to Main menu  <==" "main.sh" \
    0.0 S \
    0.0 C "h" "Help" "send-keys F1" \
    0.0 C "g" "Jump to word" "send-keys 'C-g'" \
    0.0 C "o" "Write out" "send-keys 'C-o'" \
    0.0 C "r" "Read file" "send-keys 'C-r'" \
    0.0 C "w" "Where is" "send-keys 'C-w'" \
    0.0 C "m" "Set mark" "send-keys 'C-^" \
    0.0 C "k" "Cut text" "send-keys 'C-k'" \
    0.0 C "u" "Uncut text" "send-keys 'C-u'" \
    0.0 C "t" "To spell" "send-keys 'C-t'" \
    0.0 C "c" "Cursor position" "send-keys 'C-c'" \
    0.0 C "l" "Go to line" "send-keys 'C-_'"
