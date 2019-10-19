# My dotfiles

## How to replicate
based on: https://news.ycombinator.com/item?id=11070797

```
#clone + setup
GITHUB_REPO=Piraty
git clone --separate-git-dir=$HOME/.dotfiles.git https://github.com/${GITHUB_REPO}/dotfiles.git $HOME/myconf-tmp
rm -r ~/myconf-tmp/
alias dotfiles='git --git-dir=$HOME/.dotfiles.git --work-tree=$HOME'
dotfiles config status.showUntrackedFiles no

#checkout
dotfiles status # check for modified files and move them
dotfiles checkout $HOME
```

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
  * libnotify (for on-screen responses of some toggles, like touchpad/auto-screen-blanking)
    * xset (to disable screen when locking the screen)
    * xinput (to disable touchpad on keystroke)
  * [xcape](https://github.com/alols/xcape)
