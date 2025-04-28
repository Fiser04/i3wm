#!/bin/bash

# Get current Nitrogen wallpaper
WALLPAPER=$(grep -m1 "^file=" ~/.config/nitrogen/bg-saved.cfg | cut -d= -f2-)

# Output path for temporary image
TMP_WALL="/tmp/i3lock_wall.png"

# Get screen resolution (assuming primary monitor for simplicity)
RES=$(xdpyinfo | grep dimensions | awk '{print $2}')

if [[ -f "$WALLPAPER" ]]; then
    # Convert to PNG, resize and pad without cropping
    convert "$WALLPAPER" -resize "${RES}^" -gravity center -extent "$RES" "$TMP_WALL"
    i3lock -i "$TMP_WALL" --nofork
else
    i3lock --nofork
fi

