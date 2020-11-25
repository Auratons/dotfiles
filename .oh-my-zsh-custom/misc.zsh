# --- Misc ---
alias aspell='aspell -d czech --encoding=utf-8'
alias vlna='vlna -r -v KkSsVvZzOoUuAaIi'
alias rm='rm -i'
alias jobs='jobs -l'
alias tensorboard='tensorboard --logdir .'
alias la='ls -alFh'
alias l='ls -lFh'

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

