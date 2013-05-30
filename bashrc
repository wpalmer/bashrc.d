[ -n "$BASHRC_ONCE" ] && return || BASHRC_ONCE=1
[ -z "$PS1" ] && return
. ~/git/bashrc/bashrcd
bashrc.d core load
