#!/usr/bin/env bash
HYPR="$HOME/.config/hypr"
SCRIPTS="$HYPR/scripts"

# Wallpaper
$SCRIPTS/utils/wallpaper.sh $HOME/Pictures/Wallpaper/Wallpaper &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
# Waybar
waybar -c $HYPR/ui/waybar/config -s $HYPR/ui/waybar/style.css &
# EWW Daemon
$SCRIPTS/apps/eww.sh daemon &
