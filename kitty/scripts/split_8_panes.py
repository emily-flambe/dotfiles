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
    
    # Step 2: Split top half into 4 panes
    # The original window (index 0) is now the top half
    windows = list(tab.windows)
    boss.set_active_window(windows[0])
    
    # First vertical split in top half
    boss.launch('--location=vsplit', f'--cwd={cwd}')
    
    # Move to the newly created right pane and split it
    windows = list(tab.windows)
    boss.set_active_window(windows[2])
    boss.launch('--location=vsplit', f'--cwd={cwd}')
    
    # Move to the far-right pane and split it
    windows = list(tab.windows)
    boss.set_active_window(windows[3])
    boss.launch('--location=vsplit', f'--cwd={cwd}')
    
    # Step 3: Split bottom half into 4 panes
    # The bottom half is at index 1
    windows = list(tab.windows)
    boss.set_active_window(windows[1])
    
    # First vertical split in bottom half
    boss.launch('--location=vsplit', f'--cwd={cwd}')
    
    # Move to the newly created right pane and split it
    windows = list(tab.windows)
    boss.set_active_window(windows[6])
    boss.launch('--location=vsplit', f'--cwd={cwd}')
    
    # Move to the far-right pane and split it
    windows = list(tab.windows)
    boss.set_active_window(windows[7])
    boss.launch('--location=vsplit', f'--cwd={cwd}')

handle_result.no_ui = True