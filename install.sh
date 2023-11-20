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

nvim() {
	_plugindir="$HOME/.local/share/nvim/site/pack/plugins/start"
	mkdir -p "$_plugindir"

	# these should be tracked submodules in the future
	_github="https://github.com/"
	for repo in \
		"$_github/neovim/nvim-lspconfig.git" \
		"$_github/tpope/vim-commentary.git" \
		"$_github/vim-autoformat/vim-autoformat.git"; do
		git -C "$_plugindir" clone --origin=upstream "$repo"
	done

}

lsp() {
	pipx install --include-deps python-lsp-server
	pipx inject python-lsp-server \
		pylsp-mypy \
		pyls-isort \
		python-lsp-black \
		pyls-memestra \
		pylsp-rope
}

cd "$HOME"

firefox
nvim
lsp
