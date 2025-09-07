# Dependencies

## System Requirements

### Operating System
- **macOS**: 13.0+ (Ventura or later)
- **Architecture**: Apple Silicon (M1/M2) or Intel x86_64

### Package Manager
- **Homebrew**: Latest version
  ```bash
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  ```

## Required Software

### Core Dependencies
1. **Git**: Version control
   ```bash
   brew install git
   ```

2. **Kitty Terminal**: GPU-accelerated terminal emulator
   ```bash
   brew install --cask kitty
   ```

3. **AeroSpace**: Tiling window manager
   ```bash
   brew install --cask nikitabobko/tap/aerospace
   ```

### Optional Dependencies
- **Python 3**: For Kitty automation scripts (usually pre-installed on macOS)
- **Bash 4+**: For advanced script features (macOS includes 3.2)
  ```bash
  brew install bash
  ```

## Configuration Dependencies

### Fonts
- Recommended: Nerd Fonts for icon support
  ```bash
  brew tap homebrew/cask-fonts
  brew install --cask font-hack-nerd-font
  ```

### Shell Integration
- Works with bash, zsh, or fish
- Kitty shell integration for enhanced features

## Version Compatibility

| Component | Minimum Version | Recommended |
|-----------|----------------|-------------|
| macOS     | 13.0          | Latest      |
| Kitty     | 0.29.0        | Latest      |
| AeroSpace | 0.10.0        | Latest      |
| Git       | 2.30.0        | Latest      |
| Python    | 3.8           | 3.11+       |