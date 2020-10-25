# https://zanshin.net/2013/02/02/zsh-configuration-from-the-ground-up/
# (^ is based on: https://github.com/spicycode/ze-best-zsh-config)
# 

setopt shwordsplit

# zsh plugins
. /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh || \
. /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
. /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh || \
. /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# custom config
for f in "$HOME"/.zsh/*zsh ; do
	. "$f"
done

. "$HOME"/.shrc
