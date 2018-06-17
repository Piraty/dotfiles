# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


PS1='[\u@\h \W]\$ '

source_files="$HOME/.alias $HOME/.alias_personal $HOME/bin/*.sh"
for file in $source_files; do
        [ -r $file ] && . $file || echo "$file could not be loaded"
done

shopt -s autocd
set -o noclobber #disallow existing regular files to be overwritten by redirection of shell output
shopt -s checkwinsize
