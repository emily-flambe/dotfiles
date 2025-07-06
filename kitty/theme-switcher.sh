#!/bin/bash
# Kitty Theme Switcher based on current directory

# Path to kitty executable
KITTY="/Applications/kitty.app/Contents/MacOS/kitty"

# Function to switch kitty theme based on current directory
switch_kitty_theme() {
    # Check if we're running in kitty
    if [ -z "$KITTY_WINDOW_ID" ]; then
        return
    fi
    
    local current_dir="$(pwd)"
    
    # Define directory -> theme mappings
    case "$current_dir" in
        "$HOME")
            $KITTY @ set-colors "$HOME/.config/kitty/Everforest Light Soft.conf" 2>/dev/null
            ;;
        
        *baba-is-win*)
            $KITTY @ set-colors "$HOME/.config/kitty/Black Metal.conf" 2>/dev/null
            ;;
        *SuperClaude*)
            $KITTY @ set-colors "$HOME/.config/kitty/1984 Dark.conf" 2>/dev/null
            ;;
        *chesscom-helper*)
            $KITTY @ set-colors "$HOME/.config/kitty/Monoindustrial.conf" 2>/dev/null
            ;;
        *dotfiles*)
            $KITTY @ set-colors "$HOME/.config/kitty/Red Sands.conf" 2>/dev/null
            ;;
        *esquie*)
            $KITTY @ set-colors "$HOME/.config/kitty/Cobalt Neon.conf" 2>/dev/null
            ;;
        *anonymous-comment-box*)
            $KITTY @ set-colors "$HOME/.config/kitty/Grass.conf" 2>/dev/null
            ;;
        *smart-tool-of-knowing*)
            $KITTY @ set-colors "$HOME/.config/kitty/flatland.conf" 2>/dev/null
            ;;
        *list-cutter*)
            $KITTY @ set-colors "$HOME/.config/kitty/fairyfloss.conf" 2>/dev/null
            ;;
        *notes-for-goats*)
            $KITTY @ set-colors "$HOME/.config/kitty/tokyo-night.conf" 2>/dev/null
            ;;
        *)
            # Default - keep current theme
            ;;
    esac
}

# Override cd to trigger theme switching
cd() {
    builtin cd "$@" && switch_kitty_theme
}

# Also run theme switch on shell startup
switch_kitty_theme
