#!/bin/bash
# Kitty Theme Switcher based on current directory

# Path to kitty executable
KITTY="/Applications/kitty.app/Contents/MacOS/kitty"

# Function to switch kitty theme based on current directory
switch_kitty_theme() {
    # Check if we're running in kitty
    if [ -z "$KITTY_WINDOW_ID" ]; then
        echo "[Theme Switcher] Not running in kitty terminal - skipping theme switch"
        return
    fi
    
    local current_dir="$(pwd)"
    
    # Debug: Show current directory
    echo "[Theme Switcher] Current directory: $current_dir"
    
    # Define directory -> theme mappings
    case "$current_dir" in
        "$HOME")
            echo "[Theme Switcher] Applying theme: Everforest Light Soft"
            $KITTY @ set-colors "$HOME/.config/kitty/Everforest Light Soft.conf" 2>/dev/null
            ;;
        
        *baba-is-win*)
            echo "[Theme Switcher] Applying theme: Black Metal"
            $KITTY @ set-colors "$HOME/.config/kitty/Black Metal.conf" 2>/dev/null
            ;;
        *SuperClaude*)
            echo "[Theme Switcher] Applying theme: 1984 Dark"
            $KITTY @ set-colors "$HOME/.config/kitty/1984 Dark.conf" 2>/dev/null
            ;;
        *chesscom-helper*)
            echo "[Theme Switcher] Applying theme: Monoindustrial"
            $KITTY @ set-colors "$HOME/.config/kitty/Monoindustrial.conf" 2>/dev/null
            ;;
        *dotfiles*)
            echo "[Theme Switcher] Applying theme: Red Sands"
            $KITTY @ set-colors "$HOME/.config/kitty/Red Sands.conf" 2>/dev/null
            ;;
        *esquie*)
            echo "[Theme Switcher] Applying theme: Cobalt Neon"
            $KITTY @ set-colors "$HOME/.config/kitty/Cobalt Neon.conf" 2>/dev/null
            ;;
        *anonymous-comment-box*)
            echo "[Theme Switcher] Applying theme: Grass"
            $KITTY @ set-colors "$HOME/.config/kitty/Grass.conf" 2>/dev/null
            ;;
        *smart-tool-of-knowing*)
            echo "[Theme Switcher] Applying theme: Flatland"
            $KITTY @ set-colors "$HOME/.config/kitty/flatland.conf" 2>/dev/null
            ;;
        *list-cutter*)
            echo "[Theme Switcher] Applying theme: fairyfloss"
            $KITTY @ set-colors "$HOME/.config/kitty/fairyfloss.conf" 2>/dev/null
            ;;
        *notes-for-goats*)
            echo "[Theme Switcher] Applying theme: Tokyo Night"
            $KITTY @ set-colors "$HOME/.config/kitty/tokyo-night.conf" 2>/dev/null
            ;;
        *)
            # Default - keep current theme
            echo "[Theme Switcher] No matching pattern for directory"
            ;;
    esac
}

# Override cd to trigger theme switching
cd() {
    builtin cd "$@" && switch_kitty_theme
}

# Also run theme switch on shell startup
switch_kitty_theme
