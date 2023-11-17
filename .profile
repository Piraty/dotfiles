#!/bin/sh
# profile

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

export GOPATH="$HOME/go"

export HOSTALIASES="$HOME/hosts"

# application specific settings
export LESS='--ignore-case --RAW-CONTROL-CHARS'
export LSCOLORS=Gxfxcxdxbxegedabagacad
export CLICOLOR=1

[ -d "/usr/lib/ccache/bin" ] && PATH="/usr/lib/ccache/bin/:$PATH"
PATH="$HOME/bin:$PATH"
PATH="$HOME/.local/bin:$PATH"
export PATH
