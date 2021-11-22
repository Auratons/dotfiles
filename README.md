# dotfiles
Dotfiles meant to be used in [Z shell](http://zsh.sourceforge.net) with
[oh-my-zsh](https://ohmyz.sh) and
[powerlevel10k](https://github.com/romkatv/powerlevel10k) theme.

For **installation on a fresh local machine**, you should start the process for your
OS in [one of my texts](https://github.com/Auratons/texts/blob/master/terminal-emulator-hardening.md).

For **installation on a remote machine and as the last step on the fresh local machine**,
you should use/reproduce the following in your home directory:

```bash
curl https://gist.githubusercontent.com/Auratons/2db1bd338f79bc0e7edc26ee2cf07d48/raw/912693afe40f5af3add4e5cdfa7abbfdcc6a6598/dotfiles-install.sh | /bin/bash
```

This repository was created by following a great article
https://www.atlassian.com/git/tutorials/dotfiles, for interaction with the local
repository you must use, instead of 'git', alias called 'dotcfg' (take a look
into .zshrc).

Credits also go to Alexey Samoshkin from whose repository
[tmux-config](https://github.com/samoshkin/tmux-config/tree/95efd543846a27cd2127496b74fd4f4da94f4a31)
I greatly inspired for my tmux configuration. A broader discussion is carried out in a
series of articles at
[Tmux in Practise series](https://medium.com/free-code-camp/tmux-in-practice-series-of-posts-ae34f16cfab0).
My changes to his key bindings are: the prefix is `C-s`, the status bar visibility
is switched with `<prefix> C-a`, horizontal pane split is performed `<prefix> -`
and zooming is binded to the default `<prefix> z`.

Dotfiles were tested with vim 8.0, tmux 3.1, zsh must be
enabled in `/etc/shells` (to be able to `chsh` to it) and it must be of version
5.1 and higher. On a remote server without sudo rights, zsh is out of reach
without contacting support. Other dependencies can be installed with Brew in
user space, adding a line to zshrc. An example, how to do this for tmux on a
Linux machine is below. On MacOS, the installation of brew is simpler (see
[brew.sh](https://brew.sh)). 

Note: Installation of a specific version of a tool other than tmux should
be also simpler with `<package>@<version>` brew install syntax. Before
a bugfix, tmux must had been of version <3.0, so for reference, I leave the
procedure below (or `brew edit tmux` could help).

```bash
# Install Homebrew on Linux
git clone https://github.com/Homebrew/brew ~/.homebrew
eval $(~/.homebrew/bin/brew shellenv)  # Add this also to zshrc

brew tap homebrew/homebrew-core
cd "$(brew --repo homebrew/core)"
git log master -- Formula/tmux.rb
gce b3bd700d9 # <commit_sha> of commit with tmux 2.8
cp Formula/tmux.rb <local>
gce -
cp <local> Formula/tmux.rb
brew install tmux
brew pin tmux
brew list --pinned
```

## Old systems procedure

Sources are
  - [Brewed git and curl relevant sources](https://github.com/Homebrew/brew/blob/6418230f8fc86093f96f4156a2cdcabfd55f03f7/Library/Homebrew/brew.sh#L185),
  - [User git compilation](https://gist.github.com/samrocketman/8671036#gistcomment-1595388),
  - [User curl compilation](https://curl.se/docs/install.html),
  - (less relevant https://github.com/Linuxbrew/brew/wiki/CentOS6).

```
mkdir ~/tools ~/usr
# Checkout suitable tags
git clone https://github.com/git/git.git ~/tools/git
git clone https://github.com/curl/curl.git ~/tools/curl

export PREFIX="${HOME}/usr"
export PATH="${PREFIX}/bin:${PATH}"
export PKG_CONFIG_PATH="${PREFIX}/lib/pkgconfig:${PKG_CONFIG_PATH}"
export LD_LIBRARY_PATH="${PREFIX}/lib:${LD_LIBRARY_PATH}"
export MANPATH="${PREFIX}/share/man:${MANPATH}"
export INFOPATH="${PREFIX}/share/info:${INFOPATH}"
cd ~/tools/git
autoconf && ./configure --prefix="$PREFIX" && make -j12 && make install && make man && make install-man

cd ~/tools/curl
autoreconf -fi && ./configure --prefix="$PREFIX" --with-openssl && make -j12 && make install

git clone https://github.com/Homebrew/brew ~/.homebrew
mkdir -p ~/.homebrew/opt/git/bin ~/.homebrew/opt/curl/bin
ln -s ~/usr/bin/git* ~/.homebrew/opt/git/bin
ln -s ~/usr/bin/curl* ~/.homebrew/opt/curl/bin
export HOMEBREW_FORCE_BREWED_GIT=1 HOMEBREW_FORCE_BREWED_CURL=1  # Add this also to zshrc
eval $(~/.homebrew/bin/brew shellenv)  # Add this also to zshrc
brew update
brew install tmux vim

cd ~/tools
wget https://github.com/ogham/exa/releases/download/v0.10.1/exa-linux-x86_64-musl-v0.10.1.zip
mkdir exa
unzip exa-linux-x86_64-musl-v0.10.1.zip -d exa/
alias tmux='${HOME}/.homebrew/bin/tmux'  # Add this also to the beginning of zshrc
alias exa='${HOME}/tools/exa/bin/exa'  # Add this also to the beginning of zshrc
```
