# https://zanshin.net/2013/02/02/zsh-configuration-from-the-ground-up/
# (^ is based on: https://github.com/spicycode/ze-best-zsh-config)
# 

setopt shwordsplit

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

for f in $(ls "${HOME}"/.zsh/*.zsh) ; do
	. "$f"
done

. ${HOME}/.shrc
