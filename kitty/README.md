# Kitty Configuration

## Setup

1. Run `./kitty-apply.sh` to install the configuration
2. Add this line to your `~/.zshrc` or `~/.bashrc`:
   ```bash
   source ~/.config/kitty/theme-switcher.sh
   ```
3. Restart your terminal or run `source ~/.zshrc`

## Files

- `kitty.conf` - Main kitty configuration
- `themes/` - Theme files (flatland.conf, tokyo-night.conf)
- `theme-switcher.sh` - Automatic theme switching based on directory

## Theme Switching

The theme-switcher automatically changes themes when you `cd` into different directories:
- Home directory (`~`) - Flatland theme
- `*baba-is-win*` projects - Tokyo Night theme
- `*dotfiles*` projects - Flatland theme

To manually switch themes:
```bash
kitty @ set-colors ~/.config/kitty/flatland.conf
kitty @ set-colors ~/.config/kitty/tokyo-night.conf
```

## Scripts

- `./kitty-apply.sh` - Apply configuration from this project to system
- `./kitty-pull.sh` - Pull current system configuration back to this project