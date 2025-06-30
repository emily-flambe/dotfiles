#!/bin/bash

# Setup any workspace with IDE on top and terminals horizontally tiled below

# Check if workspace letter was provided as argument
if [ -z "$1" ]; then
    echo "Which workspace would you like to set up for IDE + terminals?"
    echo "Enter a single letter or number (e.g., C, 1, X):"
    read -r workspace
else
    workspace="$1"
fi

# Validate input
if [[ ! "$workspace" =~ ^[A-Za-z0-9]$ ]]; then
    echo "Error: Workspace must be a single letter or number"
    exit 1
fi

# Convert to uppercase for consistency
workspace=$(echo "$workspace" | tr '[:lower:]' '[:upper:]')

echo "Setting up workspace $workspace for IDE + terminals layout..."

# Switch to the specified workspace
aerospace workspace "$workspace"

# Wait a moment for workspace switch
sleep 0.5

# Flatten the workspace to start fresh
aerospace flatten-workspace-tree

# Set vertical layout (for IDE on top, terminals below)
aerospace layout tiles vertical

echo "Workspace $workspace is ready!"
echo ""
echo "Next steps:"
echo "1. Open your IDE - it will be positioned in the top half"
echo "2. Open terminal windows - they will automatically tile horizontally in the bottom half"
echo ""
echo "Tips:"
echo "- Use Alt+H/T to navigate between top (IDE) and bottom (terminals)"
echo "- Use Alt+D/N to navigate between terminals horizontally"
echo "- Use Alt+$workspace to quickly switch to workspace $workspace"
echo "- Use Alt+Minus/Equal to resize windows"
echo ""
echo "To run this script directly with a workspace: $0 <workspace>"