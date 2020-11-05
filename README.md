# dotfiles
Dotfiles meant to be used in Z shell with oh-my-zsh and powerlevel10k theme.

For installation, you can use the following in your home directory:

curl https://gist.githubusercontent.com/Auratons/2db1bd338f79bc0e7edc26ee2cf07d48/raw/58531f1e6951978041be1da12897d02772f0df68/dotfiles-install.sh | /bin/bash

As a font for your terminal emulator I advise to install, set and use patched 'Hack Regular Nerd Font Complete.ttf'
from https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Hack/Regular/complete.

This repository was created by following a great article https://www.atlassian.com/git/tutorials/dotfiles,
for interaction with the local repository you must use, instead of 'git', alias called 'dotcfg' (take 
a look into .zshrc).

Credits also go to Alexey Samoshkin from whose repository
https://github.com/samoshkin/tmux-config/tree/95efd543846a27cd2127496b74fd4f4da94f4a31
I greatly inspired for my tmux configuration. A broader discussion is carried out in a
series of articles at
https://medium.com/free-code-camp/tmux-in-practice-series-of-posts-ae34f16cfab0. My changes
to his key bindings are: the prefix is `C-s`, the status bar visibility is switched with
`<prefix> C-a`, horizontal pane split is performed `<prefix> -` and zooming is binded
to the default `<prefix> z`.
