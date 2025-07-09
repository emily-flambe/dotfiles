#!/bin/bash

# Kitty Configuration Sync Script
# Syncs local kitty config files back to this dotfiles project

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DOTFILES_DIR="$(dirname "$SCRIPT_DIR")"
KITTY_CONFIG_DIR="$HOME/.config/kitty"
KITTY_PROJECT_DIR="$DOTFILES_DIR/kitty"

echo "Syncing kitty configuration from local to project..."

# Check if local kitty config exists
if [ ! -d "$KITTY_CONFIG_DIR" ]; then
    echo "Error: Local kitty config directory not found at $KITTY_CONFIG_DIR"
    exit 1
fi

# Create project kitty directory if it doesn't exist
mkdir -p "$KITTY_PROJECT_DIR/themes"

# Sync main config file
if [ -f "$KITTY_CONFIG_DIR/kitty.conf" ]; then
    echo "Syncing kitty.conf..."
    cp "$KITTY_CONFIG_DIR/kitty.conf" "$KITTY_PROJECT_DIR/kitty.conf"
else
    echo "Warning: kitty.conf not found in local config"
fi

# Sync theme files
echo "Syncing theme files..."
for theme_file in "$KITTY_CONFIG_DIR"/*.conf; do
    if [ -f "$theme_file" ] && [ "$(basename "$theme_file")" != "kitty.conf" ]; then
        theme_name=$(basename "$theme_file")
        echo "  Syncing theme: $theme_name"
        cp "$theme_file" "$KITTY_PROJECT_DIR/themes/$theme_name"
    fi
done

# Ensure private-projects.conf is synced if it exists
if [ -f "$KITTY_CONFIG_DIR/private-projects.conf" ]; then
    echo "  Syncing private-projects.conf..."
    cp "$KITTY_CONFIG_DIR/private-projects.conf" "$KITTY_PROJECT_DIR/themes/private-projects.conf"
fi

# Sync any shell scripts
if [ -f "$KITTY_CONFIG_DIR/theme-switcher.sh" ]; then
    echo "Syncing theme-switcher.sh..."
    cp "$KITTY_CONFIG_DIR/theme-switcher.sh" "$KITTY_PROJECT_DIR/theme-switcher.sh"
fi

if [ -f "$KITTY_CONFIG_DIR/split-8-panes.sh" ]; then
    echo "Syncing split-8-panes.sh..."
    cp "$KITTY_CONFIG_DIR/split-8-panes.sh" "$KITTY_PROJECT_DIR/split-8-panes.sh"
fi

echo "Sync completed successfully!"
echo "Project directory: $KITTY_PROJECT_DIR"
echo ""
echo "Files synced:"
ls -la "$KITTY_PROJECT_DIR"
echo ""
echo "Theme files:"
ls -la "$KITTY_PROJECT_DIR/themes" 2>/dev/null || echo "No theme files found"