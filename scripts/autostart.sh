#!/usr/bin/env bash
HYPR="$HOME/.config/hypr"
SCRIPTS="$HYPR/scripts"

# Wallpaper

swww init && $SCRIPTS/utils/wallpaper.sh $HOME/Pictures/Wallpaper/Wallpaper &

/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
# Waybar
waybar -c $HYPR/ui/waybar/config -s $HYPR/ui/waybar/style.css &
# Notification Daemon
swaync --config $HYPR/ui/swaync/config.json --style $HYPR/ui/swaync/style.css &
# EWW Daemon
$SCRIPTS/apps/eww.sh daemon &
