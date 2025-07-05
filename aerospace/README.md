# AeroSpace Configuration

## Overview

AeroSpace is a modern tiling window manager for macOS that automatically arranges windows without overlapping, similar to i3wm on Linux. This configuration provides a customized setup for efficient window management.

## Configuration Structure

The `.aerospace.toml` file contains all configuration settings including:
- Window gaps and padding
- Workspace assignments
- Key bindings
- Application-specific rules

## Key Bindings

All key bindings use `cmd` as the primary modifier:

### Window Focus
- `cmd + h/j/k/l` - Focus window in direction (left/down/up/right)

### Window Movement
- `cmd + shift + h/j/k/l` - Move window in direction
- `cmd + alt + h/j/k/l` - Resize window

### Workspace Navigation
- `cmd + 1-9` - Switch to workspace 1-9
- `cmd + shift + 1-9` - Move window to workspace 1-9

### Layout Management
- `cmd + /` - Toggle horizontal/vertical split
- `cmd + ,` - Cycle through accordion layouts
- `cmd + f` - Toggle fullscreen

### System Controls
- `cmd + alt + shift + r` - Reload configuration
- `cmd + t` - Open terminal (Kitty)

## Workspace Assignments

Applications are automatically assigned to specific workspaces:
- Workspace 1: Firefox
- Workspace 2: Terminal (Kitty)
- Workspace 3: Code editors (Cursor, VS Code, Zed, Sublime)
- Workspace 4: System utilities (Finder, System Information, Disk Utility)
- Workspace 5: Communication (Slack, Zoom, Teams)
- Workspace 6: Design tools (Figma, Adobe CC)
- Workspace 7: Productivity (Notion, Obsidian, Calendar)
- Workspace 8: Development tools (Postman, Insomnia, Docker)
- Workspace 9: Miscellaneous

## Customization

### Modifying Key Bindings
Edit the `[mode.main.binding]` section in `.aerospace.toml` to change or add key bindings.

### Adjusting Gaps
Modify the `gaps` section to change window spacing:
```toml
[gaps]
inner.horizontal = 10
inner.vertical = 10
outer.left = 10
outer.bottom = 10
outer.top = 10
outer.right = 10
```

### Application Rules
Add or modify application workspace assignments in the `[[on-window-detected]]` sections.

## Resources

- [AeroSpace GitHub Repository](https://github.com/nikitabobko/AeroSpace)
- [AeroSpace Documentation](https://github.com/nikitabobko/AeroSpace#readme)
- [AeroSpace Wiki](https://github.com/nikitabobko/AeroSpace/wiki)

## Installation Requirements

1. macOS 11.0 or later
2. AeroSpace installed via [Homebrew](https://brew.sh/):
   ```bash
   brew install --cask aerospace
   ```
3. Copy `.aerospace.toml` to `~/.aerospace.toml`
4. Start AeroSpace from Applications or using:
   ```bash
   open -a AeroSpace
   ```

## Additional Information

For more details on AeroSpace features and configuration options, visit the [official documentation](https://github.com/nikitabobko/AeroSpace).