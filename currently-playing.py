#!/usr/bin/env python3

'''
runs `playerctl -l` to get the list of players,
then gets the metadata for the active song using `playerctl -p ${player} metadata`
'''

import subprocess
import sys

def get_current_song():
    try:
        list_result = subprocess.run(
            ['playerctl', '-l'],
            capture_output=True, text=True, timeout=5
        )
        if list_result.returncode != 0 or not list_result.stdout.strip():
            # No players found
            return ""

        players = list_result.stdout.strip().split('\n')
        outputs = []

        # Get playing status of all players
        for player in players:
            metadata_result = subprocess.run(
                ['playerctl', '-p', player, 'metadata', '--format', '{{ artist }} - {{ title }}'],
                capture_output=True, text=True, timeout=5
            )
            if metadata_result.returncode == 0:
                outputs.append(metadata_result.stdout.strip())

        return ' | '.join(outputs)
    except FileNotFoundError:
        return "playerctl not found"
    except Exception as e:
        return f"Error: {str(e)}"

if __name__ == "__main__":
    print(get_current_song())