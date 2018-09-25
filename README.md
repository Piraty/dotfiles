# My dotfiles

## how to replicate
based on: https://news.ycombinator.com/item?id=11070797

```
#clone + setup
USER=Piraty
git clone --separate-git-dir=$HOME/.dotfiles.git https://github.com/${USER}/dotfiles.git $HOME/myconf-tmp
rm -r ~/myconf-tmp/
alias dotfiles='git --git-dir=$HOME/.dotfiles.git --work-tree=$HOME'
dotfiles config status.showUntrackedFiles no

#checkout
dotfiles status # check for modified files and move them
dotfiles checkout
```

## Dependencies
(at least the most important ones)

* [Void Linux](https://voidlinux.org)
* [zsh](https://zsh.org)
* [neovim](https://neovim.io)
* [i3wm](https://i3wm.org) (i3-gaps actually, don't ask why...)
  * [sx](https://github.com/Earnestly/sx/)
  * [slock](https://tools.suckless.org/slock/)
  * xset
  * xinput
  * acpilight
  * [redshift](https://github.com/jonls/redshift/)
  * libnotify
  * [unclutter-xfixes](https://github.com/Airblader/unclutter-xfixes/)
  * [OpenDoas](https://github.com/Duncaen/OpenDoas/)
