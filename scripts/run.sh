#!/bin/bash

xrandr --output eDP-1-1 --mode "1920x1080" --rate 60.00

feh --randomize --bg-fill ~/Wallpapers/*

picom &

dunst &

flameshot &

nm-applet &

bash ~/.config/ste-dwm/scripts/bar.sh &

while type ste-dwm >/dev/null; do ste-dwm && continue || break; done
