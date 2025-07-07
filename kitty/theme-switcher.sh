#!/bin/bash
# Kitty Theme Switcher based on current directory

# Path to kitty executable
KITTY="/Applications/kitty.app/Contents/MacOS/kitty"

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Function to try private project theme mappings
# Returns 0 if a match was found and theme was set, 1 if no match
try_private_theme() {
    local current_dir="$1"
    local private_config="$SCRIPT_DIR/private-projects.conf"
    
    # Check if private config exists
    if [ ! -f "$private_config" ]; then
        return 1
    fi
    
    # Source the private config and check for matches
    # The private config should define cases that return 0 for matches
    source "$private_config" "$current_dir"
    return $?
}

# Function to switch kitty theme based on current directory
switch_kitty_theme() {
    # Check if we're running in kitty
    if [ -z "$KITTY_WINDOW_ID" ]; then
        return
    fi
    
    local current_dir="$(pwd)"
    
    # Try private project mappings first
    if try_private_theme "$current_dir"; then
        return
    fi
    
    # Define directory -> theme mappings (public projects)
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
        *cloudflare-ai-worker*)
            $KITTY @ set-colors "$HOME/.config/kitty/Mona Lisa.conf" 2>/dev/null
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
