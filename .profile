: ${BROWSER:=$(command -v firefox 2>/dev/null)}
: ${BROWSER:=$(command -v qutebrowser 2>/dev/null)}
: ${BROWSER:=$(command -v luakit 2>/dev/null)}
: ${BROWSER:=$(command -v w3m 2>/dev/null)}

: ${EDITOR:=$(command -v vim 2>/dev/null)}
: ${EDITOR:=$(command -v nvim 2>/dev/null)}
: ${EDITOR:=$(command -v vi 2>/dev/null)}
: ${VISUAL:="$EDITOR"}

: ${PAGER:=$(command -v less 2>/dev/null)}

TEXLIVE="2018"

PATH="$HOME/bin/:$HOME/.local/bin:/usr/local/bin:/usr/local/sbin:$PATH"

#explicitly use specific texlive
PATH="/opt/texlive/$TEXLIVE/bin/x86_64-linux:$PATH"

export BROWSER EDITOR VISUAL PAGER TERMINAL TEXLIVE PATH


# application specific settings
export LESS='--ignore-case --raw-control-chars'
export LSCOLORS=Gxfxcxdxbxegedabagacad
export CLICOLOR=1
