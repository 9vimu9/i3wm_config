#!/bin/sh
 
# use this while to get named arguments
while [ $# -gt 0 ]; do
    if [[ $1 == "--"* ]]; then
        v="${1/--/}"
        declare "$v"="$2"
        shift
    fi
    shift
done
 
lap_screen_res="${lap_screen_res:-1680x1050}"
monitor_screen_res="${monitor_screen_res:-1920x1200}"
 
echo $lap_screen_res
echo $monitor_screen_res
if [[ $(xrandr | grep ' connected' -c) = 2 ]]; 	then
	$(xrandr --output HDMI-1 --primary --mode $monitor_screen_res --output eDP-1 --mode $lap_screen_res --scale 1x1 --below HDMI-1);
else
	$(xrandr --output eDP-1 --mode $lap_screen_res --scale 1x1 --pos 0x0 --primary);
fi

