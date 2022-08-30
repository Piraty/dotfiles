# My dotfiles

## How to replicate

based on: https://news.ycombinator.com/item?id=11071754

	# clone + setup
	USER=you
	REPO=https://github.com/${USER:-piraty}/dotfiles.git
	git clone --separate-git-dir=$HOME/.dotfiles.git $REPO $HOME/myconf-tmp
	rm -r $HOME/myconf-tmp/
	alias dotfiles='git --git-dir=$HOME/.dotfiles.git --work-tree=$HOME'
	dotfiles config status.showUntrackedFiles no

	# inspect conflicts + checkout
	dotfiles status # check for modified files and move them
	dotfiles checkout $HOME

## Dependencies

(at least the most important ones)

* [Void Linux](https://voidlinux.org)
* [zsh](https://zsh.org)
* [neovim](https://neovim.io)
* [OpenDoas](https://github.com/Duncaen/OpenDoas/)
* [acpilight](https://gitlab.com/wavexx/acpilight)
* [xorg]
	* [i3-gaps](https://github.com/Airblader/i3)
	* [sx](https://github.com/Earnestly/sx/)
	* [slock](https://tools.suckless.org/slock/)
	* [redshift](https://github.com/jonls/redshift/)
	* [unclutter-xfixes](https://github.com/Airblader/unclutter-xfixes/)
	* [xcape](https://github.com/alols/xcape)
	* xset
	* xinput
