# Kitty Terminal Configuration

## Overview

[Kitty](https://sw.kovidgoyal.net/kitty/) is a fast, feature-rich, GPU-accelerated terminal emulator that uses OpenGL for rendering. This configuration provides a customized setup optimized for development workflows with automatic theme switching and enhanced keyboard shortcuts.

## Resources

- [Kitty Official Website](https://sw.kovidgoyal.net/kitty/)
- [Kitty Documentation](https://sw.kovidgoyal.net/kitty/overview/)
- [Kitty Configuration Reference](https://sw.kovidgoyal.net/kitty/conf/)
- [Kitty Themes Collection](https://github.com/dexpota/kitty-themes)

## Key Features

- GPU-accelerated rendering for smooth scrolling and fast display
- True color support with ligature rendering
- Split layouts with easy keyboard shortcuts
- Automatic theme switching based on directory
- Remote control capabilities for dynamic configuration
- Multiple pre-configured themes

## Configuration Structure

```
kitty/
├── README.md                      # This file
├── kitty.conf                     # Main configuration
├── theme-switcher.sh              # Automatic theme switching script
├── private-projects.conf.example  # Example private project configuration
├── themes/                        # Color theme files
│   ├── flatland.conf
│   ├── tokyo-night.conf
│   ├── Neowave.conf
│   ├── Red Sands.conf
│   └── ...
└── scripts/                       # Helper scripts
    ├── split_4_panes.py
    └── split_8_panes.py
```

## Theme and Appearance

### Available Themes
- Flatland (default)
- Tokyo Night
- Nightfly
- Red Sands
- 1984 Dark
- Pink Lavender
- Noirbuddy Oxide

### Font Settings
- Font family: Monospace (system default)
- Font size: 14.0
- Bold/italic variants: Auto-detected

### Automatic Theme Switching

The theme-switcher automatically changes themes when navigating directories:

**Public Project Mappings:**
- Home directory (`~`) - Everforest Light Soft theme
- `*baba-is-win*` projects - Black Metal theme
- `*SuperClaude*` projects - 1984 Dark theme
- `*dotfiles*` projects - Red Sands theme
- `*esquie*` projects - Cobalt Neon theme
- `*cloudflare-ai-worker*` projects - Mona Lisa theme

**Private Project Support:**
For work or private projects that you don't want tracked in version control, you can create a local `private-projects.conf` file:

1. Copy the example file:
   ```bash
   cp ~/.config/kitty/private-projects.conf.example ~/.config/kitty/private-projects.conf
   ```

2. Edit `private-projects.conf` to add your private project mappings:
   ```bash
   # Example: Map work projects to specific themes
   *my-work-project*) 
       $KITTY @ set-colors "$HOME/.config/kitty/Neowave.conf" 2>/dev/null
       return 0
       ;;
   ```

3. The private config file is automatically gitignored to keep project names private.

**Setup:**
To enable automatic switching:
```bash
source ~/.config/kitty/theme-switcher.sh
```

To manually switch themes:
```bash
kitty @ set-colors ~/.config/kitty/themes/flatland.conf
kitty @ set-colors ~/.config/kitty/themes/Neowave.conf
```

## Keyboard Shortcuts

### Window Splitting
- `cmd+d` - Split vertically (side by side)
- `cmd+shift+d` - Split horizontally (top and bottom)
- `cmd+4` - Split into 4 equal panes (2x2 grid)
- `cmd+8` - Split into 8 equal panes (2x4 grid)
- `cmd+enter` - Toggle fullscreen for current pane

### Navigation
- `cmd+'` - Move to window on the left
- `cmd+,` - Move to window below
- `cmd+.` - Move to window above
- `cmd+p` - Move to window on the right
- `cmd+[` - Previous window
- `cmd+]` - Next window
- `cmd+shift+'` - Previous tab
- `cmd+shift+p` - Next tab

### Window Management
- `cmd+w` - Close current pane
- `cmd+shift+r` - Reload configuration

### Theme Management
- `cmd+r` - Refresh theme in all panes

## Setup Instructions

1. Run `./kitty-apply.sh` to install the configuration
2. Add this line to your `~/.zshrc` or `~/.bashrc`:
   ```bash
   source ~/.config/kitty/theme-switcher.sh
   ```
3. Restart your terminal or run `source ~/.zshrc`

## Modifying the Configuration

### Basic Customization

1. **Change Font**: Edit `font_family` and `font_size` in kitty.conf
2. **Adjust Colors**: Select a different theme file or create your own
3. **Add Shortcuts**: Add new mappings in the keyboard shortcuts section

### Adding Custom Shortcuts
```
map cmd+key action_name
map cmd+shift+key kitten_name
```

### Creating Custom Themes

1. Copy an existing theme file from `themes/`
2. Modify the color values
3. Update `theme-switcher.sh` to include your theme in the rotation

### Performance Tuning

Uncomment and adjust these settings in kitty.conf:
```
repaint_delay 10
input_delay 3
sync_to_monitor yes
```

## Scripts

### Deployment Scripts
- `./kitty-apply.sh` - Apply configuration from this project to system
- `./kitty-pull.sh` - Pull current system configuration back to this project

### Layout Scripts
- `scripts/split_4_panes.py` - Creates 2x2 grid layout
- `scripts/split_8_panes.py` - Creates 2x4 grid layout

## Integration

This configuration is designed to work seamlessly with:
- Shell environments (zsh, bash)
- Development tools requiring terminal graphics
- Remote control for dynamic theme switching
- Multiple simultaneous terminal sessions

## Troubleshooting

### Common Issues

1. **Theme not switching**: Ensure theme-switcher.sh is sourced in your shell
2. **Split layouts not working**: Verify `enabled_layouts splits` is uncommented
3. **Shortcuts not working**: Check for conflicts with macOS system shortcuts

### Debug Mode

Run kitty with debug output:
```bash
kitty --debug-gl
kitty --debug-input
```

For complete configuration options, see the official documentation: https://sw.kovidgoyal.net/kitty/conf/