#!/bin/bash
# Split Kitty into 4 equal panes while preserving the current working directory

# Get the current working directory
CWD=$(pwd)

# Use kitty remote control to create splits with explicit cwd
kitty @ launch --type=window --location=hsplit --cwd="$CWD"
kitty @ launch --type=window --location=vsplit --cwd="$CWD"
kitty @ focus-window --match neighbor:up
kitty @ launch --type=window --location=vsplit --cwd="$CWD"