[ -n "$BASHRC_ONCE" ] && return || BASHRC_ONCE=1

if [ -e ~/.paths.low ]; then
	export PATH="$PATH$(cat ~/.paths.low | tr '\n' :|sed -e 's/^/:/' -e 's/::*/:/g' -e 's/:$//' -e 's/^:$//')"
fi
if [ -e ~/.paths.high ]; then
	export PATH="$(cat ~/.paths.high | tr '\n' :|sed -e 's/$/:/' -e 's/::*/:/g' -e 's/^:$//')$PATH"
fi

[ -z "$PS1" ] && return

for bashrcd in /etc/bashrc.d ~/.bashrc.d; do
    bashrc_profiling=()
    if [ -d "$bashrcd" ]; then
        for bashrc in "$bashrcd"/*; do
            bashrc_source_begin="$(date +'%s%N')"
            . "$bashrc"
            bashrc_source_end="$(date +'%s%N')"
	    bashrc_profiling[${#bashrc_profiling[@]}]="$(( bashrc_source_end - bashrc_source_begin ))"
	    bashrc_profiling[${#bashrc_profiling[@]}]="$bashrc"
	    bashrc_profiling[${#bashrc_profiling[@]}]=$'\n'
        done
    fi
    bashrc_profile(){ echo -n "${bashrc_profiling[@]}" | sort -n | awk '{printf "%.5f %s\n", ($1/1000000000), $2}'; }
done
