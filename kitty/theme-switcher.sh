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
            # Home directory - use default theme
            $KITTY @ set-colors ~/.config/kitty/flatland.conf 2>/dev/null
            ;;
        
        # Active GitHub repositories (updated in last 3 months)
        *"baba-is-win"*)
            # Game project - use Tokyo Night theme
            $KITTY @ set-colors ~/.config/kitty/tokyo-night.conf 2>/dev/null
            ;;
        *"SuperClaude"*)
            # AI enhancement project - use 1984 Dark theme
            $KITTY @ set-colors ~/.config/kitty/"1984 Dark.conf" 2>/dev/null
            ;;
        *"chesscom-helper"*)
            # Chess helper - use Tokyo Night theme
            $KITTY @ set-colors ~/.config/kitty/tokyo-night.conf 2>/dev/null
            ;;
        *"dotfiles"*)
            # Dotfiles - use Red Sands theme
            echo "[Theme Switcher] Matched dotfiles directory - switching to Red Sands theme"
            $KITTY @ set-colors ~/.config/kitty/"Red Sands.conf" 2>/dev/null
            if [ $? -eq 0 ]; then
                echo "[Theme Switcher] Theme switch successful"
            else
                echo "[Theme Switcher] Theme switch failed - check if kitty remote control is enabled"
            fi
            ;;
        *"esquie"*)
            # Esquie project - use 1984 Dark theme
            $KITTY @ set-colors ~/.config/kitty/"1984 Dark.conf" 2>/dev/null
            ;;
        *"anonymous-comment-box"*)
            # Comment box - use Flatland theme
            $KITTY @ set-colors ~/.config/kitty/flatland.conf 2>/dev/null
            ;;
        *"emily-flambe"*)
            # Personal project - use Tokyo Night theme
            $KITTY @ set-colors ~/.config/kitty/tokyo-night.conf 2>/dev/null
            ;;
        *"llm-prompts"*)
            # LLM prompts - use 1984 Dark theme
            $KITTY @ set-colors ~/.config/kitty/"1984 Dark.conf" 2>/dev/null
            ;;
        *"smart-tool-of-knowing"*)
            # Knowledge tool - use Flatland theme
            $KITTY @ set-colors ~/.config/kitty/flatland.conf 2>/dev/null
            ;;
        *"notes-for-goats"*)
            # Notes project - use Tokyo Night theme
            $KITTY @ set-colors ~/.config/kitty/tokyo-night.conf 2>/dev/null
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