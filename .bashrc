# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

for src in \
	"$HOME/.colors" \
	"$HOME/.bash_prompt" \
	"$HOME/.shrc" \
	; do
	[ -f "$src" ] && . "$src"
done

shopt -s autocd
shopt -s checkwinsize

#disallow existing regular files to be overwritten by redirection of shell output
set -o noclobber

. $HOME/.shrc
