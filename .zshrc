setopt shwordsplit

for plugin in \
	zsh-autosuggestions \
	zsh-syntax-highlighting \
	; do
	for searchpath in \
		/usr/share/ \
		/usr/share/zsh/plugins/ \
		; do
		p="$searchpath/${plugin}/${plugin}.zsh"
		[ -f "$p" ] && . "$p"
	done
done

# custom config
for f in "$HOME"/.zsh/*zsh ; do
	. "$f"
done

. "$HOME"/.shrc
