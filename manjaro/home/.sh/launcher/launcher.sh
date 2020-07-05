#!/bin/bash
#
# Bash scripts launcher with usage of rofi.
#
# @requirements: cd, echo, exec, ls, notify-send, rofi
#
# @author Maciej Bedra

SCRIPTS_PATH="$HOME/.sh"
cd "$SCRIPTS_PATH"
SCRIPTS=$(ls -A1 *.sh)

if [[ ! -z "$SCRIPTS" ]]
then
	SELECTED_SCRIPT=$(echo -e "$SCRIPTS" | rofi -lines 5 -dmenu)
else
	notify-send "No scripts to execute"
fi

if [[ ! -z "$SELECTED_SCRIPT" ]]
then
	notify-send "Executing $SELECTED_SCRIPT"
	exec "$SCRIPTS_PATH/$SELECTED_SCRIPT"
fi
