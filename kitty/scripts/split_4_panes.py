#!/usr/bin/env python3
"""
Custom Kitty kitten to split window into 4 equal panes.
Place this file in ~/.config/kitty/ and use with:
map cmd+4 kitten split_4_panes.py
"""

def main(args):
    pass

def handle_result(args, answer, target_window_id, boss):
    """Create 4 equal panes preserving the current working directory."""
    
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
    
    # First horizontal split - this creates bottom pane and we stay in it
    boss.launch('--location=hsplit', f'--cwd={cwd}')
    
    # Split the bottom pane vertically - now we have bottom-left and bottom-right
    boss.launch('--location=vsplit', f'--cwd={cwd}')
    
    # Get all windows and find the first one (should be the top pane)
    windows = list(tab.windows)
    if len(windows) >= 3:
        # Focus on the first window (the original top pane)
        boss.set_active_window(windows[0])
        
        # Now split the top pane vertically
        boss.launch('--location=vsplit', f'--cwd={cwd}')

handle_result.no_ui = True