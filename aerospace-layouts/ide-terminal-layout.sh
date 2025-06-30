#!/bin/bash
# Recreate IDE + terminals layout

# Move to workspace C (or your preferred workspace)
aerospace workspace C

# Flatten and set vertical layout
aerospace flatten-workspace-tree
aerospace layout tiles vertical

echo "Layout ready! Now:"
echo "1. Open your IDE (it will be on top)"
echo "2. Open terminals (they will tile horizontally below)"