#!/bin/sh
# common functions

notify() {
	: ${notifycmd:=$(command -v notify-send.sh)}
	: ${notifycmd:=$(command -v notify-send)}

	local TITLE="$1"
	local TEXT="$2"
	local ICON="$3"

	if [ -z "$notifycmd" ]; then
		[ ! -z "$TITLE" ] && printf "${TITLE}: "
		echo "$TEXT"
	else
		$notifycmd "$TITLE" "$TEXT" -i "$ICON"
	fi
}

failmsg() {
	notify "FAILURE" "$1"
	exit 1
}
