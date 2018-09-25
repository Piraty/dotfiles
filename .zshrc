# https://zanshin.net/2013/02/02/zsh-configuration-from-the-ground-up/
# (^ is based on: https://github.com/spicycode/ze-best-zsh-config)
# 

source ~/.zsh/checks.zsh
source ~/.zsh/colors.zsh
source ~/.zsh/setopt.zsh
source ~/.zsh/prompt.zsh
source ~/.zsh/completion.zsh
source ~/.zsh/bindkeys.zsh
source ~/.zsh/history.zsh
source ~/.zsh/zsh_hooks.zsh

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


files=("$HOME/.alias" "$HOME"/bin/*.sh)
for file in $files; do
	[ -r "$file" ] && . "$file" || echo "$file could not be sourced ($?)"
done

# fail silently if personal files are missing
files=("$HOME/.alias_personal")
for file in $files; do
	[ -r "$file" ] && . "$file"
done
