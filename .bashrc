[ -n "$BASHRC_ONCE" ] && return || BASHRC_ONCE=1

if [ -e ~/.paths.low ]; then
	export PATH="$PATH$(cat ~/.paths.low | tr '\n' :|sed -e 's/^/:/' -e 's/::*/:/g' -e 's/:$//' -e 's/^:$//')"
fi
if [ -e ~/.paths.high ]; then
	export PATH="$(cat ~/.paths.high | tr '\n' :|sed -e 's/$/:/' -e 's/::*/:/g' -e 's/^:$//')$PATH"
fi

[ -z "$PS1" ] && return

for bashrcd in /etc/bashrc.d ~/.bashrc.d; do
    if [ -d "$bashrcd" ]; then
        for bashrc in "$bashrcd"/*; do
            . "$bashrc"
        done
    fi
done
