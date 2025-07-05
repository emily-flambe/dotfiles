# Dotfiles

Personal configuration files for macOS.

## Kitty Terminal

Custom Kitty terminal configuration with:
- **Smart pane splitting** - Cmd+4 (4 panes) and Cmd+8 (8 panes) with working directory preservation
- **Theme switcher** - Multiple color themes with easy switching
- **Custom key mappings** - Optimized for MacBook keyboards

### Installation

```bash
./install/kitty-apply.sh
```

See [install/README.md](install/README.md) for detailed installation instructions.

## Structure

```
.
├── install/          # Installation and sync scripts
├── kitty/           # Kitty terminal configuration
│   ├── kitty.conf   # Main configuration
│   ├── scripts/     # Python kittens for advanced features
│   └── themes/      # Color themes
└── README.md        # This file
```