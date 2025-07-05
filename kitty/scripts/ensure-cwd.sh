#!/bin/bash
# Ensure all Kitty panes are in the same working directory
# This script can be run after splitting to fix any cwd issues

# Get the current working directory
CWD=$(pwd)

# Send cd command to all windows in the current tab
kitty @ send-text --match=state:parent_active "cd '$CWD'\r"