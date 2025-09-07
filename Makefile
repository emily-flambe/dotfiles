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

# Help
help:
	@echo "Available commands:"
	@echo "  make kitty              - Apply kitty config to ~/.config/kitty/"
	@echo "  make kitty ACTION=import - Import kitty config from ~/.config/kitty/"
	@echo "  make aero               - Apply aerospace config to ~/.config/aerospace/"
	@echo "  make aero ACTION=import  - Import aerospace config from ~/.config/aerospace/"

.PHONY: kitty aero help