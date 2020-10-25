#This file controls the use of the precmd, preexec and postcmd features.

function precmd {
  # vcs_info
  # Put the string "hostname::/full/directory/path" in the title bar:
  echo -ne "\e]2;$PWD\a"

  # Put the parentdir/currentdir in the tab
  echo -ne "\e]1;$PWD:h:t/$PWD:t\a"
}

function set_running_app {
	return 0 #FIXME?
  printf "\e]1; ${PWD}:t:$(history "$HISTCMD" | cut -b7- ) \a"
  printf '\e]1; %s:t:%s \a' "${PWD}" "$(history "$HISTCMD" | cut -b7- )"
}

function preexec {
  set_running_app
}

function postexec {
  set_running_app
}
