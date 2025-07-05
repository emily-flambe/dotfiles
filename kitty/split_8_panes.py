#!/usr/bin/env python3
"""
Custom Kitty kitten to split window into 8 equal panes (2x4 grid).
Place this file in ~/.config/kitty/ and use with:
map cmd+8 kitten split_8_panes.py
"""

def main(args):
    pass

def handle_result(args, answer, target_window_id, boss):
    """Create 8 equal panes preserving the current working directory."""
    
    window = boss.active_window
    if not window:
        return
    
    # Store the original cwd
    cwd = window.cwd_of_child
    if not cwd:
        import os
        cwd = os.getcwd()
    
    # Get the active tab to work with windows
    tab = boss.active_tab
    
    # Step 1: Create horizontal split (top and bottom halves)
    boss.launch('--location=hsplit', f'--cwd={cwd}')
    
    # Step 2: Split bottom half into 4 panes
    # First vertical split in bottom
    boss.launch('--location=vsplit', f'--cwd={cwd}')
    # Second vertical split in bottom-right
    boss.launch('--location=vsplit', f'--cwd={cwd}')
    
    # Move to bottom-left (window index 2)
    windows = list(tab.windows)
    if len(windows) >= 4:
        boss.set_active_window(windows[2])
        # Third vertical split in bottom-left
        boss.launch('--location=vsplit', f'--cwd={cwd}')
    
    # Step 3: Move to top half and split into 4 panes
    windows = list(tab.windows)
    if len(windows) >= 5:
        # Focus on the first window (the original top pane)
        boss.set_active_window(windows[0])
        
        # First vertical split in top
        boss.launch('--location=vsplit', f'--cwd={cwd}')
        # Second vertical split in top-right
        boss.launch('--location=vsplit', f'--cwd={cwd}')
        
        # Move to top-left (window index 0)
        windows = list(tab.windows)
        if len(windows) >= 7:
            boss.set_active_window(windows[0])
            # Third vertical split in top-left
            boss.launch('--location=vsplit', f'--cwd={cwd}')

handle_result.no_ui = True