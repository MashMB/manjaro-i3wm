#!/bin/bash
#
# Configure screen layout that depends on displays setup.
#
# @requirements: conky, echo, fix_xcursor, killall, nitrogen, notify-send, rofi, sleep, start_conky_maia, xrandr
#
# @author Maciej Bedra

OEM="OEM"
SINGLE_EXTERNAL="SingleExternal"
LV_OEM="LeftVertical < OEM"
SELECTED_LAYOUT=$(echo -e "$OEM\n$SINGLE_EXTERNAL\n$LV_OEM" | rofi -lines 5 -dmenu)

if [[ ! -z "$SELECTED_LAYOUT" ]]
then
	if [[ "$SELECTED_LAYOUT" == "$OEM" ]]
	then
		xrandr --output eDP1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output DP1 --off --output DP2 --off --output HDMI1 --off --output HDMI2 --off --output VIRTUAL1 --off
	elif [[ "$SELECTED_LAYOUT" == "$SINGLE_EXTERNAL" ]] 
	then
		xrandr --output eDP1 --off --output DP1 --off --output DP2 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI1 --off --output HDMI2 --off --output VIRTUAL1 --off
	elif [[ "$SELECTED_LAYOUT" == "$LV_OEM" ]]
	then
		xrandr --output eDP1 --primary --mode 1920x1080 --pos 1080x420 --rotate normal --output DP1 --mode 1920x1080 --pos 0x0 --rotate left --output DP2 --off --output HDMI1 --off --output HDMI2 --off --output VIRTUAL1 --off
	fi

	nitrogen --set-zoom-fill --restore
	killall conky
	sleep 5
	start_conky_maia
	fix_xcursor
	notify-send "Screen layout: $SELECTED_LAYOUT"
fi
