# --- Misc ---
alias aspell='aspell -d czech --encoding=utf-8'
alias vlna='vlna -r -v KkSsVvZzOoUuAaIi'
alias rm='rm -i'
alias jobs='jobs -l'
alias tensorboard='tensorboard --logdir .'


if type exa >/dev/null; then
    # general use
    alias ls=' exa'
    alias l='  exa --long --group --binary --classify --group-directories-first'
    alias la=' exa --long --group --binary --classify --group-directories-first --all'
    alias ll=' exa -lbhHigUmuSa --time-style=long-iso --color-scale'
    alias llm='exa --long --group --binary --classify --sort=modified'

    # speciality views
    alias lS='exa -1'			        # one column, just names
    alias lt='exa --tree --level=2'     # tree
else
    alias la='ls -alFh'
    alias l='ls -lFh'
fi

function reload() {
    source ~/.zshrc
    tmux source-file ~/.tmux.conf
}

# pip zsh completion start
function _pip_completion {
  local words cword
  read -Ac words
  read -cn cword
  reply=( $( COMP_WORDS="$words[*]" \
             COMP_CWORD=$(( cword-1 )) \
             PIP_AUTO_COMPLETE=1 $words[1] 2>/dev/null ))
}
compctl -K _pip_completion pip
# pip zsh completion end

