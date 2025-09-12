# Dotfiles Makefile
# Simple commands to sync configurations

# Default action is apply
ACTION ?= apply

# Kitty terminal configuration
kitty:
ifeq ($(ACTION),import)
	@echo "Importing kitty configuration..."
	@cp -r ~/.config/kitty/* kitty/ 2>/dev/null || true
	@echo "Kitty configuration imported."
else
	@echo "Applying kitty configuration..."
	@mkdir -p ~/.config/kitty/themes
	@cp -r kitty/* ~/.config/kitty/ 2>/dev/null || true
	@echo "Kitty configuration applied."
endif

# Aerospace window manager configuration  
aero:
ifeq ($(ACTION),import)
	@echo "Importing aerospace configuration..."
	@mkdir -p aerospace
	@cp ~/.config/aerospace/aerospace.toml aerospace/ 2>/dev/null || true
	@echo "Aerospace configuration imported."
else
	@echo "Applying aerospace configuration..."
	@mkdir -p ~/.config/aerospace
	@cp aerospace/aerospace.toml ~/.config/aerospace/ 2>/dev/null || true
	@echo "Aerospace configuration applied."
endif

# OpenCode configuration
opencode:
ifeq ($(ACTION),import)
	@echo "Importing opencode configuration..."
	@mkdir -p opencode/command
	@cp ~/.config/opencode/command/*.md opencode/command/ 2>/dev/null || true
	@cp ~/.config/opencode/opencode.json opencode/ 2>/dev/null || true
	@echo "OpenCode configuration imported."
else
	@echo "Installing opencode configuration..."
	@mkdir -p ~/.config/opencode/command
	@echo "Installing custom commands..."
	@cp opencode/command/*.md ~/.config/opencode/command/ 2>/dev/null || true
	@echo "Setting up transparent theme for kitty compatibility..."
	@cat opencode/opencode.json > ~/.config/opencode/opencode.json
	@echo "OpenCode configuration installed."
	@echo ""
	@echo "Available commands:"
	@ls -1 opencode/command/*.md | xargs -n1 basename | sed 's/\.md$$//g' | sed 's/^/  \//g'
endif

# Help
help:
	@echo "Available commands:"
	@echo "  make kitty              - Apply kitty config to ~/.config/kitty/"
	@echo "  make kitty ACTION=import - Import kitty config from ~/.config/kitty/"
	@echo "  make aero               - Apply aerospace config to ~/.config/aerospace/"
	@echo "  make aero ACTION=import  - Import aerospace config from ~/.config/aerospace/"
	@echo "  make opencode           - Install opencode commands and config"
	@echo "  make opencode ACTION=import - Import opencode config from ~/.config/opencode/"

.PHONY: kitty aero opencode help