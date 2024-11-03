#!/bin/bash

# Directory containing wallpapers
WALLPAPER_DIR="/home/k/Pictures/wall"

# Use feh to set a random wallpaper
feh --bg-scale "$(find "$WALLPAPER_DIR" -type f | shuf -n 1)"
