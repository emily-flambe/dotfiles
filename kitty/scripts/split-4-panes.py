#!/usr/bin/env python3
"""
Kitty custom kitten to split into 4 equal panes while preserving cwd.
This ensures all panes inherit the parent pane's working directory.
"""

import os
import sys
from kitty.boss import Boss

def main(args):
    pass

def handle_result(args, answer, target_window_id, boss: Boss):
    """Split current window into 4 panes, preserving cwd."""
    
    # Get the current window
    window = boss.active_window
    if not window:
        return
    
    # Get the current working directory of the active window
    cwd = window.child.cwd
    if not cwd:
        # Fallback to home if we can't get cwd
        cwd = os.path.expanduser('~')
    
    # First, create horizontal split (top and bottom)
    boss.launch(
        '--location=hsplit',
        f'--cwd={cwd}',
        '--type=window'
    )
    
    # Create vertical split in the bottom pane
    boss.launch(
        '--location=vsplit', 
        f'--cwd={cwd}',
        '--type=window'
    )
    
    # Navigate to top pane
    boss.active_window.neighboring_window('up')
    
    # Create vertical split in the top pane
    boss.launch(
        '--location=vsplit',
        f'--cwd={cwd}',
        '--type=window'
    )

handle_result.no_ui = True