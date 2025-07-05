# Kitty Pane Split CWD Fix

## Problem
When splitting Kitty into multiple panes (especially 4-split and 8-split views), some panes were staying in the home directory (~) instead of inheriting the current working directory from the parent pane.

## Root Cause
The issue occurs when using `combine` with navigation commands like `neighboring_window`. The navigation changes the active window context, causing subsequent `launch` commands to lose the original pane's working directory.

## Solutions Implemented

### 1. Updated Keyboard Shortcuts
- **Cmd+4**: Now creates 4 equal panes and ensures all use the parent's cwd
- **Cmd+8**: Now creates 8 equal panes and ensures all use the parent's cwd
- **Cmd+Shift+4**: Forces all panes in current tab to use parent's cwd (recovery command)

### 2. Key Changes
- Replaced `neighboring_window` with `focus_window --match=neighbor:` for better control
- Added `send_text --match=state:parent_active cd .\r` at the end to ensure cwd sync
- The `cd .` command forces all panes to change to the current directory

### 3. Additional Scripts
- `split-4-panes.sh`: Shell script using Kitty remote control
- `split-4-panes.py`: Python kitten for more robust splitting
- `ensure-cwd.sh`: Script to force all panes to use current cwd

## Usage
1. Reload Kitty config: `Cmd+Shift+R`
2. Use `Cmd+4` or `Cmd+8` to split panes - all should now inherit the correct cwd
3. If any pane has the wrong directory, use `Cmd+Shift+4` to fix all panes

## Testing
1. Navigate to any directory: `cd /some/path`
2. Press `Cmd+4` to create 4 panes
3. Run `pwd` in each pane - all should show `/some/path`