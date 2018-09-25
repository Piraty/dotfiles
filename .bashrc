# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

source ~/.colors
#PS1='[\u@\h \W]\$ '
source ~/.bash_prompt

shopt -s autocd
set -o noclobber #disallow existing regular files to be overwritten by redirection of shell output
shopt -s checkwinsize


files="$HOME/.alias $HOME/bin/*.sh"
for file in $files; do
	[ -r "$file" ] && . "$file" || echo "$file could not be sourced ($?)"
done

# fail silently if personal files are missing
files="$HOME/.alias_personal"
for file in $source_files; do
	[ -r "$file" ] && . "$file"
done
