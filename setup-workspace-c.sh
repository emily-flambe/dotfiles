#!/bin/bash

# Setup workspace C with IDE on top and terminals horizontally tiled below

echo "Setting up workspace C for IDE + terminals layout..."

# Switch to workspace C
aerospace workspace C

# Wait a moment for workspace switch
sleep 0.5

# Flatten the workspace to start fresh
aerospace flatten-workspace-tree

# Set vertical layout (for IDE on top, terminals below)
aerospace layout tiles vertical

echo "Workspace C is ready!"
echo ""
echo "Next steps:"
echo "1. Open Cursor (IDE) - it will be positioned in the top half"
echo "2. Open your terminal windows - they will automatically tile horizontally in the bottom half"
echo ""
echo "Tips:"
echo "- Use Alt+H/T to navigate between top (IDE) and bottom (terminals)"
echo "- Use Alt+D/N to navigate between terminals horizontally"
echo "- Use Alt+C to quickly switch to workspace C"
echo "- Use Alt+Minus/Equal to resize windows"