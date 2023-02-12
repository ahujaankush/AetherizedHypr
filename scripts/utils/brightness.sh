#!/usr/bin/env bash
# Brightness handler using brightnessctl
ICONDIR=$HOME/.config/hypr/ui/icons/aether/dark

function cbright {
    brightnessctl i | grep '%' | awk -F'(' '{print $2}' | awk -F'%' '{print $1}'
}

function notify {
    brightness=`cbright`
    
    if [ "$brightness" = "0" ]; then
        icon_name="$ICONDIR/brightness-off"
    else    
        if [  "$brightness" -lt "10" ]; then
            icon_name="$ICONDIR/brightness-low"
        else
            if [ "$brightness" -lt "30" ]; then
                icon_name="$ICONDIR/brightness-low"
            else
                if [ "$brightness" -lt "70" ]; then
                    icon_name="$ICONDIR/brightness-medium"
                else
                    if [ "$brightness" -lt "100" ]; then
                        icon_name="$ICONDIR/brightness-high"
                    else
                        icon_name="$ICONDIR/brightness-full"
                    fi
                fi
            fi
        fi
    fi
    echo "$brightness" > ~/.config/i3/scripts/brightness-current
    notify-send -i "$icon_name.png" -t 2000 -r 1234 "$brightness" "Brightness"
}

case $1 in
    up)
	brightnessctl set 2%+ > /dev/null
	notify
	;;
    down)
    brightnessctl set 2%- > /dev/null
	notify
	;;
    optimal)
    # Toggle optimal
	brightnessctl set 25% > /dev/null
    notify
	;;
esac     
