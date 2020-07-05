#!/bin/bash
#
# Enable or disable dunst notifications.
#
# @requirements: notify-send, rofi, sleep
#
# @author Maciej Bedra

ENABLE_OPTION="enable notifications"
DISABLE_OPTION="disable notifications"
SELECTED_OPTION=$(echo -e "$ENABLE_OPTION\n$DISABLE_OPTION" | rofi -lines 5 -dmenu)

if [[ ! -z "$SELECTED_OPTION" ]]
then
	if [[ "$SELECTED_OPTION" == "$ENABLE_OPTION" ]]
	then
		notify-send "DUNST_COMMAND_RESUME"
		sleep 2
		notify-send "Notifications enabled"
	elif [[ "$SELECTED_OPTION" == "$DISABLE_OPTION" ]]
	then
		notify-send "Notifications disabled"
		sleep 2
		notify-send "DUNST_COMMAND_PAUSE"
	fi
fi
