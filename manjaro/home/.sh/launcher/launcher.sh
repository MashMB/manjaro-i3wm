#!/bin/bash
#
# Bash scripts launcher with usage of rofi.
#
# @requirements: cd, echo, exec, ls, rofi
#
# @author Maciej Bedra

SCRIPTS_PATH="$HOME/.sh"
cd "$SCRIPTS_PATH"
SCRIPTS=$(ls -A1 *.sh)

if [[ ! -z "$SCRIPTS" ]]
then
	SELECTED_SCRIPT=$(echo -e "$SCRIPTS" | rofi -dmenu)
fi

if [[ ! -z "$SELECTED_SCRIPT" ]]
then
	exec "$SCRIPTS_PATH/$SELECTED_SCRIPT"
fi
