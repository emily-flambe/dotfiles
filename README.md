# Dotfiles

Personal configuration files for macOS development environment.

This is how you know I am a serious person!


## Overview

This repository contains configuration files and setup scripts for:
- **[Kitty Terminal](https://sw.kovidgoyal.net/kitty/)** - GPU-accelerated terminal emulator with custom layouts and themes
- **[AeroSpace](https://github.com/nikitabobko/AeroSpace)** - Tiling window manager for macOS with workspace management
- **Claude Code** - [My fork of SuperClaude](https://github.com/emily-flambe/SuperClaude) contains my own deranged set of custom configurations and commands.


## Prerequisites

- macOS (tested on Darwin 24.5.0)
- [Homebrew](https://brew.sh/) for package management
- Git for version control

## Installation

### Quick Setup

1. Clone the repository:
```bash
git clone https://github.com/emilycogsdill/dotfiles.git
cd dotfiles
```

2. Install configurations:
```bash
# Install Kitty terminal configuration
./install/kitty-apply.sh

# Copy AeroSpace configuration manually
cp aerospace/.aerospace.toml ~/.aerospace.toml
```

### Manual Installation

If you prefer to manually install specific configurations:

- **Kitty**: Copy contents of `kitty/` to `~/.config/kitty/`
- **AeroSpace**: Copy `aerospace/.aerospace.toml` to `~/.aerospace.toml`

## Resources

- [Kitty Documentation](https://sw.kovidgoyal.net/kitty/)
- [AeroSpace Documentation](https://github.com/nikitabobko/AeroSpace)
- [Homebrew](https://brew.sh/)

## Repository Structure

```
.
├── aerospace/        # AeroSpace window manager configuration
│   └── .aerospace.toml
├── install/          # Installation and synchronization scripts
│   ├── kitty-apply.sh   # Install Kitty configuration
│   └── kitty-pull.sh    # Pull latest Kitty config from system
└── kitty/            # Kitty terminal configuration
    ├── kitty.conf       # Main configuration file
    ├── scripts/         # Python scripts for advanced features
    │   ├── split_4_panes.py   # Create 4-pane layout
    │   └── split_8_panes.py   # Create 8-pane layout
    ├── theme-switcher.sh      # Theme switching functionality
    └── themes/          # Color themes collection
```

## Features

### Kitty Terminal

- **Smart Pane Splitting**: Quick layouts with Cmd+4 (4 panes) and Cmd+8 (8 panes)
- **Theme Switcher**: Multiple color themes with easy switching via shell function
- **GPU Acceleration**: Optimized rendering for smooth performance
- **Custom Key Mappings**: Tailored for macOS and development workflows

### AeroSpace Window Manager

- **Tiling Layouts**: Automatic window arrangement with tiles and accordion modes
- **Workspace Management**: Multiple workspaces (1-9, A-Z) with quick switching
- **Custom Keybindings**: Alt-based navigation using Dvorak-friendly layout (d,h,t,n for left,down,up,right)
- **Monitor-Specific Settings**: Different gap configurations for different displays

## Usage

### Kitty Terminal

See the Kitty README in `kitty/README.md` for detailed usage instructions and keyboard shortcuts.

### AeroSpace

Key bindings (all use Alt modifier):
- **Navigation**: Alt + d/h/t/n (left/down/up/right)
- **Move Windows**: Alt + Shift + d/h/t/n
- **Workspaces**: Alt + 1-9, Alt + letter
- **Resize**: Alt + minus/equal
- **Service Mode**: Alt + Shift + semicolon

## License

These are personal configuration files provided as-is for reference and use.