#!/bin/bash
# Save current workspace layout

workspace=$(aerospace list-workspaces --focused)
echo "Saving layout for workspace $workspace"

# Save window list and tree structure
aerospace list-windows --workspace $workspace > ~/.aerospace-layout-$workspace.txt
aerospace tree --workspace $workspace > ~/.aerospace-tree-$workspace.txt

echo "Layout saved to ~/.aerospace-layout-$workspace.txt and ~/.aerospace-tree-$workspace.txt"