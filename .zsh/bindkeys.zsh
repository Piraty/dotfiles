# To see the key combo you want to use just do:
# cat > /dev/null
# And press it

bindkey "^K"      kill-whole-line                      # ctrl-k
bindkey "^R"      history-incremental-search-backward  # ctrl-r
bindkey "^A"      beginning-of-line                    # ctrl-a  
bindkey "^E"      end-of-line                          # ctrl-e
bindkey "[B"      history-search-forward               # down arrow
bindkey "[A"      history-search-backward              # up arrow
bindkey "^D"      delete-char                          # ctrl-d
bindkey "^F"      forward-char                         # ctrl-f
bindkey "^B"      backward-char                        # ctrl-b
bindkey -v   # Default to standard vi bindings, regardless of editor string

autoload edit-command-line
zle -N edit-command-line
bindkey -M vicmd ' ' edit-command-line


# as seen here: http://zshwiki.org/home/zle/bindkeys#reading_terminfo
typeset -A key

key[Home]="$terminfo[khome]"
key[End]="$terminfo[kend]"
key[Insert]="$terminfo[kich1]"
key[Backspace]="$terminfo[kbs]"
key[Delete]="$terminfo[kdch1]"
key[Up]="$terminfo[kcuu1]"
key[Down]="$terminfo[kcud1]"
key[Left]="$terminfo[kcub1]"
key[Right]="$terminfo[kcuf1]"
key[PageUp]="$terminfo[kpp]"
key[PageDown]="$terminfo[knp]"

# setup key accordingly
[ -n "$key[Home]"      ] && bindkey -- "$key[Home]"      beginning-of-line
[ -n "$key[End]"       ] && bindkey -- "$key[End]"       end-of-line
[ -n "$key[Insert]"    ] && bindkey -- "$key[Insert]"    overwrite-mode
[ -n "$key[Backspace]" ] && bindkey -- "$key[Backspace]" backward-delete-char
[ -n "$key[Delete]"    ] && bindkey -- "$key[Delete]"    delete-char
[ -n "$key[Up]"        ] && bindkey -- "$key[Up]"        up-line-or-history
[ -n "$key[Down]"      ] && bindkey -- "$key[Down]"      down-line-or-history
[ -n "$key[Left]"      ] && bindkey -- "$key[Left]"      backward-char
[ -n "$key[Right]"     ] && bindkey -- "$key[Right]"     forward-char
#[ -n "$key[PageUp]"    ] && bindkey -- "$key[PageUp]"    forward-word
#[ -n "$key[PageDown]"  ] && bindkey -- "$key[PageDown]"  backward-word
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "^H" backward-delete-word


# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
    function zle-line-init () {
        echoti smkx
    }
    function zle-line-finish () {
        echoti rmkx
    }
    zle -N zle-line-init
    zle -N zle-line-finish
fi
