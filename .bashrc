# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

source ~/.colors
#PS1='[\u@\h \W]\$ '
source ~/.bash_prompt

shopt -s autocd
set -o noclobber #disallow existing regular files to be overwritten by redirection of shell output
shopt -s checkwinsize

. ${HOME}/.shrc
