# Git aliases
alias gst='git status'
alias gdf='git diff'
alias gad='git add'
alias glog='git log --oneline'
alias gco='git commit'
alias grm='git rm'
alias gce='git checkout'
alias gba='git branch -a'
alias glg="git log --all --color --graph --pretty=format:'%Cred%h%Creset -%C(auto)%d%Creset %C(auto)%s%C(reset) %Cgreen(%cr) %C(bold blue)%an'"
alias gsm='gst -suno | sed -E "s/[[:blank:]]?M[[:blank:]]//"'
alias grh='git reset HEAD'
alias gu='git fetch --all --tags --prune  &&  git merge --ff-only @{u}'
alias gud='git fetch --all --tags --prune  &&  git rebase origin/develop'

# Git Flow aliases
alias gff='git flow feature'
alias gffs='git flow feature start'
alias gfff='git flow feature finish'
