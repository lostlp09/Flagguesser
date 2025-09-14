#!/bin/sh
echo -ne '\033c\033]0;Neues Spiel\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/flagguesser.x86_64" "$@"
