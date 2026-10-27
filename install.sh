#!/usr/bin/env zsh
set -euo pipefail

REPO="https://raw.githubusercontent.com/yurehito/fastfetch-cat-theme-config/main"
CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/fastfetch"

mkdir -p "$CONFIG_DIR"

# Back up the existing config if one exists
if [[ -f "$CONFIG_DIR/config.jsonc" ]]; then
    cp "$CONFIG_DIR/config.jsonc" "$CONFIG_DIR/config.jsonc.backup"
    echo "Existing config backed up to config.jsonc.backup"
fi

# Download the theme files
curl -fL "$REPO/blac-meow-icon.png" \
  -o "$CONFIG_DIR/blac-meow-icon.png"

curl -fL "$REPO/config.jsonc" \
  -o "$CONFIG_DIR/config.jsonc"

# Update the logo path to match the local config directory
sed -i "s|~/.config/fastfetch/blac-meow-icon.png|$CONFIG_DIR/blac-meow-icon.png|g" \
  "$CONFIG_DIR/config.jsonc"

echo "Fastfetch theme installed!"
echo "Run: fastfetch"
