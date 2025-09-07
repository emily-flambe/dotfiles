#!/bin/bash
# Kitty Theme Switcher based on current directory
# Uses JSON configuration files for theme mappings

# Path to kitty executable
KITTY="/Applications/kitty.app/Contents/MacOS/kitty"

# Get the directory where this script is located
SCRIPT_DIR="$HOME/.config/kitty"

# Function to read JSON config and find matching theme
find_theme_for_path() {
    local current_dir="$1"
    local config_file="$2"
    
    # Check if config file exists
    if [ ! -f "$config_file" ]; then
        return 1
    fi
    
    # Use Python for JSON parsing (reliable on macOS)
    local theme=$(python3 -c "
import json
import os
import re
import sys

try:
    with open('$config_file', 'r') as f:
        data = json.load(f)

    current_dir = '$current_dir'
    home_env = os.environ.get('HOME', '')
    
    for mapping in data.get('mappings', []):
        if 'path' in mapping:
            path = mapping['path'].replace('$' + 'HOME', home_env)
            if current_dir == path:
                print(mapping['theme'])
                sys.exit(0)
        elif 'pattern' in mapping:
            pattern = mapping['pattern'].replace('*', '.*')
            if re.search(pattern, current_dir):
                print(mapping['theme'])
                sys.exit(0)
except Exception as e:
    print(f'[ERROR] {e}', file=sys.stderr)
" 2>/dev/null)
    
    if [ -n "$theme" ]; then
        echo "$theme"
        return 0
    fi
    
    return 1
}

# Function to switch kitty theme based on current directory
switch_kitty_theme() {
    # Check if we're running in kitty
    if [ -z "$KITTY_WINDOW_ID" ]; then
        return
    fi
    
    local current_dir="$(pwd)"
    local theme=""
    
    # Try private mappings first
    theme=$(find_theme_for_path "$current_dir" "$SCRIPT_DIR/theme-mappings-private.json")
    
    # If no private mapping found, try public mappings
    if [ -z "$theme" ]; then
        theme=$(find_theme_for_path "$current_dir" "$SCRIPT_DIR/theme-mappings.json")
    fi
    
    # Apply theme if found
    if [ -n "$theme" ]; then
        local theme_file="$SCRIPT_DIR/themes/${theme}.conf"
        if [ -f "$theme_file" ]; then
            $KITTY @ set-colors --reset 2>/dev/null
            $KITTY @ set-colors "$theme_file" 2>/dev/null
        else
            # Try without themes/ prefix for backward compatibility
            theme_file="$SCRIPT_DIR/${theme}.conf"
            if [ -f "$theme_file" ]; then
                $KITTY @ set-colors --reset 2>/dev/null
                $KITTY @ set-colors "$theme_file" 2>/dev/null
            fi
        fi
    fi
}

# Override cd to trigger theme switching
cd() {
    builtin cd "$@" && switch_kitty_theme
}

# Also run theme switch on shell startup
switch_kitty_theme