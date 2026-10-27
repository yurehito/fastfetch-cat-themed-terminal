#!/usr/bin/env zsh
set -euo pipefail

REPO="https://raw.githubusercontent.com/yurehito/fastfetch-cat-theme-config/main"
CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/fastfetch"

mkdir -p "$CONFIG_DIR"

# back up the existing config if one exists
if [[ -f "$CONFIG_DIR/config.jsonc" ]]; then
    cp "$CONFIG_DIR/config.jsonc" "$CONFIG_DIR/config.jsonc.backup"
    echo "Existing config backed up to config.jsonc.backup"
fi

# download the theme files
curl -fL "$REPO/black-meow-icon.png" \
  -o "$CONFIG_DIR/black-meow-icon.png"

curl -fL "$REPO/config.jsonc" \
  -o "$CONFIG_DIR/config.jsonc"

# update the logo path to match the local config directory
sed -i "s|~/.config/fastfetch/black-meow-icon.png|$CONFIG_DIR/black-meow-icon.png|g" \
  "$CONFIG_DIR/config.jsonc"

echo "fastfetch theme installed! ᓚᘏᗢ"
echo "run: fastfetch"
