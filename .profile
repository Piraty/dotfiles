#!/bin/sh

: ${BROWSER:=$(command -v firefox 2>/dev/null)}
: ${BROWSER:=$(command -v qutebrowser 2>/dev/null)}
: ${BROWSER:=$(command -v luakit 2>/dev/null)}
: ${BROWSER:=$(command -v w3m 2>/dev/null)}
export BROWSER

: ${EDITOR:=$(command -v nvim 2>/dev/null)}
: ${EDITOR:=$(command -v vim 2>/dev/null)}
: ${EDITOR:=$(command -v vi 2>/dev/null)}
: ${VISUAL:="$EDITOR"}
export EDITOR VISUAL

: ${PAGER:=$(command -v less 2>/dev/null)}
export PAGER

# XDG
export XDG_CACHE_HOME=$HOME/.cache
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
[ -d "/run/user/$(id -u)" ] && export XDG_RUNTIME_DIR="/run/user/$(id -u)"

export ENV="$HOME/.shrc"

export HOSTALIASES="$HOME/hosts"

# application specific settings
export LESS='--ignore-case --RAW-CONTROL-CHARS'
export LSCOLORS=Gxfxcxdxbxegedabagacad
export CLICOLOR=1

PATH="$HOME/bin/:$HOME/.local/bin:/usr/local/bin:/usr/local/sbin:$PATH"
export PATH
