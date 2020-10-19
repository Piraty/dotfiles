#!/bin/sh

path() {
# display a neatly formatted path
	echo $PATH | tr ":" "\n" | \
	 awk "{ sub(\"/usr\",   \"$fg_no_bold[green]/usr$reset_color\"); \
			sub(\"/bin\",   \"$fg_no_bold[blue]/bin$reset_color\"); \
			sub(\"/opt\",   \"$fg_no_bold[cyan]/opt$reset_color\"); \
			sub(\"/sbin\",  \"$fg_no_bold[magenta]/sbin$reset_color\"); \
			sub(\"/local\", \"$fg_no_bold[yellow]/local$reset_color\"); \
			print }"
}

nicemount() {
# nice mount (http://catonmat.net/blog/another-ten-one-liners-from-commandlinefu-explained)
# displays mounted drive information in a nicely formatted manner
	(
		echo "DEVICE PATH TYPE FLAGS" && mount | awk '$2="";1'
	) | column -t
}

notify() {
	: ${notifycmd:=$(command -v notify-send.sh)}
	: ${notifycmd:=$(command -v notify-send)}

	local TITLE="$1"
	local TEXT="$2"
	local ICON="$3"

	if [ -n "$notifycmd" ]; then
		$notifycmd "$TITLE" "$TEXT" -i "$ICON"
	else
		printf '%s %s\n' "${TITLE}:" "$TEXT"
	fi
}
notify_fail() {
	notify "FAILURE" "$1"
	exit 1
}
