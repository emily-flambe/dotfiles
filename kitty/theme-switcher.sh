#!/bin/bash
# Kitty Theme Switcher based on current directory

# Function to switch kitty theme based on current directory
switch_kitty_theme() {
    local current_dir="$(pwd)"
    
    # Define directory -> theme mappings
    case "$current_dir" in
        "$HOME")
            # Home directory - use default theme
            kitty @ set-colors ~/.config/kitty/flatland.conf 2>/dev/null
            ;;
        
        # Active GitHub repositories (updated in last 3 months)
        *"baba-is-win"*)
            # Game project - use Tokyo Night theme
            kitty @ set-colors ~/.config/kitty/tokyo-night.conf 2>/dev/null
            ;;
        *"SuperClaude"*)
            # AI enhancement project - use 1984 Dark theme
            kitty @ set-colors ~/.config/kitty/"1984 Dark.conf" 2>/dev/null
            ;;
        *"chesscom-helper"*)
            # Chess helper - use Tokyo Night theme
            kitty @ set-colors ~/.config/kitty/tokyo-night.conf 2>/dev/null
            ;;
        *"dotfiles"*)
            # Dotfiles - use Flatland theme
            kitty @ set-colors ~/.config/kitty/flatland.conf 2>/dev/null
            ;;
        *"esquie"*)
            # Esquie project - use 1984 Dark theme
            kitty @ set-colors ~/.config/kitty/"1984 Dark.conf" 2>/dev/null
            ;;
        *"anonymous-comment-box"*)
            # Comment box - use Flatland theme
            kitty @ set-colors ~/.config/kitty/flatland.conf 2>/dev/null
            ;;
        *"emily-flambe"*)
            # Personal project - use Tokyo Night theme
            kitty @ set-colors ~/.config/kitty/tokyo-night.conf 2>/dev/null
            ;;
        *"llm-prompts"*)
            # LLM prompts - use 1984 Dark theme
            kitty @ set-colors ~/.config/kitty/"1984 Dark.conf" 2>/dev/null
            ;;
        *"smart-tool-of-knowing"*)
            # Knowledge tool - use Flatland theme
            kitty @ set-colors ~/.config/kitty/flatland.conf 2>/dev/null
            ;;
        *"notes-for-goats"*)
            # Notes project - use Tokyo Night theme
            kitty @ set-colors ~/.config/kitty/tokyo-night.conf 2>/dev/null
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