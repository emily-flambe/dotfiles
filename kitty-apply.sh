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

# Install scripts directory
if [ -d "$KITTY_SOURCE_DIR/scripts" ]; then
    echo "Installing scripts directory..."
    mkdir -p "$KITTY_CONFIG_DIR/scripts"
    cp -r "$KITTY_SOURCE_DIR/scripts/"* "$KITTY_CONFIG_DIR/scripts/"
    chmod +x "$KITTY_CONFIG_DIR/scripts/"*.sh "$KITTY_CONFIG_DIR/scripts/"*.py 2>/dev/null || true
fi

# Install Python kittens
if ls "$KITTY_SOURCE_DIR/"*.py 1> /dev/null 2>&1; then
    echo "Installing Python kittens..."
    cp "$KITTY_SOURCE_DIR/"*.py "$KITTY_CONFIG_DIR/"
    chmod +x "$KITTY_CONFIG_DIR/"*.py
fi

# Make sure permissions are correct
chmod 644 "$KITTY_CONFIG_DIR/kitty.conf"

echo "Kitty configuration installed successfully!"
echo "Configuration location: $KITTY_CONFIG_DIR/kitty.conf"

# Reload theme-switcher if we're in an interactive shell
if [[ $- == *i* ]]; then
    if [ -n "$KITTY_WINDOW_ID" ]; then
        echo ""
        echo "Reloading theme-switcher script..."
        source "$KITTY_CONFIG_DIR/theme-switcher.sh"
        echo "Theme switcher reloaded!"
    else
        echo ""
        echo "Note: Run 'source ~/.zshrc' in your kitty terminal to activate the theme switcher."
    fi
fi

echo ""
echo "To apply changes:"
echo "1. Restart kitty terminal"
echo "2. Or use Cmd+Shift+R to reload config in kitty"
echo ""
echo "To uninstall, restore from backup:"
echo "mv $KITTY_CONFIG_DIR/kitty.conf.backup $KITTY_CONFIG_DIR/kitty.conf"