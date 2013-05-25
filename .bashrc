[ -z "$PS1" ] && return

export PATH=~/.bin:"$PATH"

for bashrc in ~/.bashrc.d/*; do
	. "$bashrc"
done
