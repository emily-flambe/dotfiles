# Kitty Installation Scripts

This directory contains scripts for managing Kitty terminal configuration.

## Scripts

### kitty-apply.sh
Installs Kitty configuration from this dotfiles repo to your system.

```bash
./install/kitty-apply.sh
```

This will:
- Copy `kitty.conf` to `~/.config/kitty/`
- Install all theme files
- Install the theme-switcher script
- Install Python kittens from the scripts directory
- Set proper permissions

### kitty-pull.sh
Syncs your local Kitty configuration back to this dotfiles repo.

```bash
./install/kitty-pull.sh
```

Use this when you've made changes to your local Kitty config that you want to save back to the dotfiles repo.

## Quick Start

1. To apply Kitty configuration:
   ```bash
   cd ~/Documents/GitHub/dotfiles
   ./install/kitty-apply.sh
   ```

2. To sync changes back:
   ```bash
   cd ~/Documents/GitHub/dotfiles
   ./install/kitty-pull.sh
   ```