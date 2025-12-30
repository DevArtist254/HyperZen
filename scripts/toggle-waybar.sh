#!/bin/bash

# Check if waybar is running
if pgrep -x "waybar" >/dev/null; then
  killall waybar
  notify-send "Waybar" "Waybar hidden"
else 
  waybar &
  notify-send "Waybar" "Waybar shown"
fi
