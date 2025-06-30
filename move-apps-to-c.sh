#!/bin/bash

# Move Cursor and Terminal windows to workspace C

echo "Moving IDE and terminals to workspace C..."

# Get all Cursor windows and move them to workspace C
aerospace list-windows | grep "Cursor" | awk '{print $1}' | while read window_id; do
    aerospace move-node-to-workspace --node-id "$window_id" C
done

# Get all Terminal windows and move them to workspace C
aerospace list-windows | grep "Terminal" | awk '{print $1}' | while read window_id; do
    aerospace move-node-to-workspace --node-id "$window_id" C
done

# Switch to workspace C
aerospace workspace C

# Set up the layout
aerospace flatten-workspace-tree
aerospace layout tiles vertical

echo "Done! All Cursor and Terminal windows moved to workspace C"