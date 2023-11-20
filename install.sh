#!/bin/sh
#install dotfiles if necessary

firefox() {
	(
		cd "$HOME/.mozilla/firefox" || return
		[ -r ./profiles.ini ] || return

		for profile_path in $(grep Path profiles.ini | cut -d= -f2-); do
			echo "install firefox profile: $profile_path"
			ln -s "$HOME/user.js" "./$profile_path/user.js"
			mkdir -p "./$profile_path/chrome"
			ln -s "$HOME/userContent.css" "./$profile_path/chrome/userContent.css"
		done
	)
}

cd $HOME

firefox
