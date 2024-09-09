#!/bin/bash
# Directory where wallpapers are stored
WALLPAPER_DIR="/home/ste/Wallpapers"

# Select a random wallpaper
WALLPAPER=$(find "$WALLPAPER_DIR" -type f | shuf -n 1)

# Set the wallpaper using feh
feh --bg-scale "$WALLPAPER"
