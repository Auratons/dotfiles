# Git aliases
alias gst='git status'
alias gdf='git diff'
alias gad='git add'
alias glog='git log --oneline'
alias gco='git commit'
alias grm='git rm'
alias gce='git checkout'
alias gba='git branch -a'
alias glg='git log --branches --remotes --tags --graph --oneline --decorate'
alias gsm='gst -suno | sed -E "s/[[:blank:]]?M[[:blank:]]//"'

# Git Flow aliases
alias gff='git flow feature'
alias gffs='git flow feature start'
alias gfff='git flow feature finish'
