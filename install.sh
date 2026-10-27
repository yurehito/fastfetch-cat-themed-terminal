#!/usr/bin/env bash
set -euo pipefail

REPO="https://raw.githubusercontent.com/yurehito/fastfetch-cat-theme-config/main"
CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/fastfetch"

mkdir -p "$CONFIG_DIR"

curl -fL "$REPO/blac-meow-icon.png" \
  -o "$CONFIG_DIR/blac-meow-icon.png"

curl -fL "$REPO/config.jsonc" \
  -o "$CONFIG_DIR/config.jsonc"
  
sed -i "s|~/.config/fastfetch/blac-meow-icon.png|$CONFIG_DIR/blac-meow-icon.png|g" \
  "$CONFIG_DIR/config.jsonc"

echo "Fastfetch theme installed!"
echo "Run: fastfetch"
