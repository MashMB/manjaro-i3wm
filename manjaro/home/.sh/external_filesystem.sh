#!/bin/bash
#
# Automate external filesystem mounting/unmounting.
#
# @requirements: awk, cd, echo, gksu, ls, lsblk, mkdir, mount, notify-send, rm, rofi, umount
#
# @author Maciej Bedra

DEV_PATH="/dev/"
MOUNT_POINT="/run/media/"
MOUNT_OPTION="mount"
UNMOUNT_OPTION="unmount"
SELECTED_OPTION=$(echo -e "$MOUNT_OPTION\n$UNMOUNT_OPTION" | rofi -dmenu)

function select_filesystem() {
	UNMOUNTED=$(lsblk --raw --noheadings -o NAME,SIZE,MOUNTPOINT | awk '$3 == ""')

	if [[ ! -z "$UNMOUNTED" ]]
	then
		SELECTED_FILESYSTEM=$(echo -e "$UNMOUNTED" | rofi -dmenu)
	fi

	echo "$SELECTED_FILESYSTEM" | awk '{print $1}'
}

function select_mount_point() {
	cd $MOUNT_POINT
	MOUNTS=$(ls -A1)

	if [[ ! -z "MOUNTS" ]]
	then
		SELECTED_MOUNT=$(echo -e "$MOUNTS" | rofi -dmenu)
	fi

	echo "$SELECTED_MOUNT"
	cd $WORKING_DIR
}


if [[ ! -z "$SELECTED_OPTION" ]]
then
	if [[ "$SELECTED_OPTION" == "$MOUNT_OPTION" ]]
	then
		SELECTED_FILESYSTEM="$(select_filesystem)"

		if [[ ! -z "$SELECTED_FILESYSTEM" ]]
		then
			gksu mkdir -p "$MOUNT_POINT$SELECTED_FILESYSTEM"
			gksu mount -t auto "$DEV_PATH$SELECTED_FILESYSTEM" "$MOUNT_POINT$SELECTED_FILESYSTEM"
			notify-send "Mounted: $SELECTED_FILESYSTEM"
		fi
	elif [[ "$SELECTED_OPTION" == "$UNMOUNT_OPTION" ]]
	then
		SELECTED_MOUNT="$(select_mount_point)"

		if [[ ! -z "$SELECTED_MOUNT" ]]
		then
			gksu umount "$MOUNT_POINT$SELECTED_MOUNT"
			gksu rm -rf "$MOUNT_POINT$SELECTED_MOUNT"
			notify-send "Unmounted: $SELECTED_MOUNT"
		fi
	else
		exit 0
	fi
fi