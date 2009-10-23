export PATH=~/.bin:"$PATH"

[ -z "$PS1" ] && return

for bashrc in ~/.bashrc.d/*; do
	. "$bashrc"
done
