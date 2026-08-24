#!/bin/bash

set -euo pipefail

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
source_dir="$script_dir/config/nvim"
target_dir="$HOME/.config/nvim"

mkdir -p "$target_dir"
cp -a "$source_dir/." "$target_dir/"
