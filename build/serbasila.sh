#!/bin/sh
echo -ne '\033c\033]0;Serbasila\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/serbasila.x86_64" "$@"
