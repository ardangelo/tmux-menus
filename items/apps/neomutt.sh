#!/bin/sh
CURRENT_DIR=$(cd -- "$(dirname -- "$0")" && pwd)
SCRIPT_DIR="$(dirname "$CURRENT_DIR")/scripts"

# shellcheck disable=SC1091
. "$SCRIPT_DIR/dialog_handling.sh"

set -- \
    0.0 M Left "Back to Main menu  <==" "main.sh" \
    0.0 T "-Index" \
    0.0 C "c" "Change mailbox" "send-keys c" \
    0.0 C "f" "Forward" "send-keys f" \
    0.0 C "g" "Reply all" "send-keys g" \
    0.0 C "m" "Compose new message" "send-keys m" \
    0.0 C "r" "Reply" "send-keys r" \
    0.0 C "s" "Move message" "send-keys s" \
    0.0 C "F" "Flag message" "send-keys F" \
    0.0 C "L" "Notmuch query" "send-keys L" \
    0.0 C "N" "Mark as new" "send-keys N" \
    0.0 C "\$" "Save mailbox changes" "send-keys \$" \
    0.0 C "Z" "Remote sync" "send-keys Z"
