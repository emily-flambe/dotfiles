#!/bin/bash

# Kitty Terminal Configuration Installer
# This script installs kitty configuration files from this dotfiles repo

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
KITTY_CONFIG_DIR="$HOME/.config/kitty"
KITTY_SOURCE_DIR="$SCRIPT_DIR/kitty"

echo "Installing kitty configuration..."

# Create kitty config directory if it doesn't exist
if [ ! -d "$KITTY_CONFIG_DIR" ]; then
    echo "Creating kitty config directory: $KITTY_CONFIG_DIR"
    mkdir -p "$KITTY_CONFIG_DIR"
fi

# Backup existing config if it exists
if [ -f "$KITTY_CONFIG_DIR/kitty.conf" ]; then
    echo "Backing up existing kitty.conf to kitty.conf.backup"
    cp "$KITTY_CONFIG_DIR/kitty.conf" "$KITTY_CONFIG_DIR/kitty.conf.backup"
fi

# Install kitty.conf
echo "Installing kitty.conf..."
cp "$KITTY_SOURCE_DIR/kitty.conf" "$KITTY_CONFIG_DIR/kitty.conf"

# Install theme files
if [ -d "$KITTY_SOURCE_DIR/themes" ]; then
    echo "Installing theme files..."
    mkdir -p "$KITTY_CONFIG_DIR/themes"
    cp "$KITTY_SOURCE_DIR/themes/"*.conf "$KITTY_CONFIG_DIR/" 2>/dev/null || true
fi

# Install theme-switcher script
if [ -f "$KITTY_SOURCE_DIR/theme-switcher.sh" ]; then
    echo "Installing theme-switcher script..."
    cp "$KITTY_SOURCE_DIR/theme-switcher.sh" "$KITTY_CONFIG_DIR/theme-switcher.sh"
    chmod +x "$KITTY_CONFIG_DIR/theme-switcher.sh"
fi

# Install split-8-panes script (if it exists)
if [ -f "$KITTY_SOURCE_DIR/split-8-panes.sh" ]; then
    echo "Installing split-8-panes script..."
    cp "$KITTY_SOURCE_DIR/split-8-panes.sh" "$KITTY_CONFIG_DIR/split-8-panes.sh"
    chmod +x "$KITTY_CONFIG_DIR/split-8-panes.sh"
fi

# Make sure permissions are correct
chmod 644 "$KITTY_CONFIG_DIR/kitty.conf"

echo "Kitty configuration installed successfully!"
echo "Configuration location: $KITTY_CONFIG_DIR/kitty.conf"

# Reload theme-switcher if it's already sourced
if type switch_kitty_theme &>/dev/null; then
    echo ""
    echo "Reloading theme-switcher script..."
    source "$KITTY_CONFIG_DIR/theme-switcher.sh"
    echo "Theme switcher reloaded!"
fi

echo ""
echo "To apply changes:"
echo "1. Restart kitty terminal"
echo "2. Or use Cmd+Shift+R to reload config in kitty"
echo ""
echo "To uninstall, restore from backup:"
echo "mv $KITTY_CONFIG_DIR/kitty.conf.backup $KITTY_CONFIG_DIR/kitty.conf"