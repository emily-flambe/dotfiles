#!/usr/bin/env python3

def main(args):
    pass

def handle_result(args, answer, target_window_id, boss):
    # Simple test - just create one split with a message
    boss.launch('--location=hsplit', 'echo', 'KITTEN IS WORKING!')

handle_result.no_ui = True