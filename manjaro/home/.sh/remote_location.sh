#!/bin/bash
# 
# Automate FTP/SFTP remote location mounting (connection string to clipboard) and unmounting.
#
# @requirements: basename, cd, curlftpfs, echo, fusermount3, gksu, ls, mkdir, notify-send, pwd, rm, rofi, source, sshfs, sudo, xclip
#
# @author Maciej Bedra

WORKING_DIR=$(pwd)
SCRIPT_NAME=$(basename $BASH_SOURCE)
CONFIG_DIR="${SCRIPT_NAME%.*}"
MOUNT_POINT="/run/media/"
MOUNT_OPTION="mount"
UNMOUNT_OPTION="unmount"
FTP_PROTOCOL="FTP"
SFTP_PROTOCOL="SFTP"
SELECTED_OPTION=$(echo -e "$MOUNT_OPTION\n$UNMOUNT_OPTION" | rofi -dmenu)

function select_configuration() {
	cd $CONFIG_DIR
	CONFIGS=$(ls -A1)

	if [[ ! -z "$CONFIGS" ]]
	then
		SELECTED_CONFIG=$(echo -e "$CONFIGS" | rofi -dmenu)
	fi

	echo "$SELECTED_CONFIG"
	cd ..
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

if [[ "$SELECTED_OPTION" == "$MOUNT_OPTION" ]]
then
	SELECTED_CONFIG="$(select_configuration)"

	if [[ ! -z "$SELECTED_CONFIG" ]]
	then
		gksu mkdir -p "$MOUNT_POINT/$SELECTED_CONFIG"
		source "$WORKING_DIR/$CONFIG_DIR/$SELECTED_CONFIG"

		if [[ "$PROTOCOL" == "$FTP_PROTOCOL" ]]
		then
			COMMAND="sudo curlftpfs ftp://$HOST $MOUNT_POINT$SELECTED_CONFIG -o allow_other -o user=$USERNAME"	
		elif [[ "$PROTOCOL" == "$SFTP_PROTOCOL" ]]
		then
			COMMAND="sudo sshfs $USERNAME@$HOST:$REMOTE_DIR $MOUNT_POINT$SELECTED_CONFIG -o allow_other -p $PORT -C"
		else
			exit 0
		fi

		echo "$COMMAND" | xclip -sel clip
		notify-send "Connection command in clipboard"	
	fi
elif [[ "$SELECTED_OPTION" == "$UNMOUNT_OPTION" ]]
then
	SELECTED_MOUNT="$(select_mount_point)"

	if [[ ! -z "$SELECTED_MOUNT" ]]
	then
		gksu fusermount3 -u "$MOUNT_POINT$SELECTED_MOUNT"
		gksu rm -rf "$MOUNT_POINT$SELECTED_MOUNT"
	fi
fi
