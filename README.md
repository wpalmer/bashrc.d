bashrc.d
========

Example usage:

    # basic loading, rot13 toy
    $ . bashrcd
    $ bashrc.d load toys
    $ rot13 hello world
    uryyb jneyq
    $

    # on-demand loading, prompt-command
    $ . bashrcd
    $ bashrc.d prompt-command poke echo-hello 'echo hello world'
    hello world
    $

This is my .bashrc file. I have used some variant of it for over a decade. Eventually, it reached critical mass and was split into various separate components. More-recently, I've cleaned it up somewhat to remove most "system-specific" sections, or references to servers from old jobs.

This still contains much historical cruft- there are several large components which I simply don't use anymore, and components are inconsistent regarding which systems they target, in terms of compatibility. More importantly, some of them are just old, large, and bad.

That said, they are "good enough" for my daily use, and now that private server details have been removed, it's also "good enough" for public release.

All files as of this point are released into the public domain.
