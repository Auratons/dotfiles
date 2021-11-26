export ZSH="${HOME}/.oh-my-zsh"

ZSH_CUSTOM="${HOME}/.oh-my-zsh-custom"
ZSH_THEME="powerlevel10k/powerlevel10k"

ZSH_TMUX_AUTOSTART=true
ZSH_TMUX_UNICODE=true
ZSH_TMUX_AUTOCONNECT=true

if [ -d ".homebrew" ]; then
    export HOMEBREW_MAKE_JOBS=16
    export HOMEBREW_NO_ANALYTICS=1
    eval $($HOME/.homebrew/bin/brew shellenv)
fi

# Alias for managing dotfiles.
alias dotcfg='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias tigcfg='GIT_DIR=$HOME/.dotfiles/ WORK_TREE=$HOME tig'

autoload -Uz is-at-least && is-at-least 5.1 || return

zmodload zsh/langinfo
if [[ ${langinfo[CODESET]:-} != (utf|UTF)(-|)8 ]]; then
    local LC_ALL=${${(@M)$(locale -a):#*.(utf|UTF)(-|)8}[1]:-en_US.UTF-8}
fi

###############################################################################
#                     Beginning of powerlevel10k settings                     #
###############################################################################

    ZLE_RPROMPT_INDENT=0

    typeset -g POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
        # =========================[ Line #1 ]=========================
        context                 # user@hostname
        anaconda                # conda environment (https://conda.io/)
        goenv                   # go environment (https://github.com/syndbg/goenv)
        nodenv                  # node.js version from nodenv (https://github.com/nodenv/nodenv)
        nvm                     # node.js version from nvm (https://github.com/nvm-sh/nvm)
        nodeenv                 # node.js environment (https://github.com/ekalinin/nodeenv)
        rbenv                   # ruby version from rbenv (https://github.com/rbenv/rbenv)
        rvm                     # ruby version from rvm (https://rvm.io)
        jenv                    # java version from jenv (https://github.com/jenv/jenv)
        kubecontext             # current kubernetes context (https://kubernetes.io/)
        dir                     # current directory
        dir_writable            # if not writeable -> better icon stylizing than in dir segment
        vcs                     # git status
        # =========================[ Line #2 ]=========================
        newline
        prompt_char             # prompt symbol
    )

    typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
        # =========================[ Line #1 ]=========================
        command_execution_time  # duration of the last command
        background_jobs         # presence of background jobs
        vim_shell               # vim shell indicator (:sh in vim editor)
        vpn_ip                  # virtual private network indicator
        time                    # current time
        # =========================[ Line #2 ]=========================
        newline
    )

    typeset -g POWERLEVEL9K_MODE=nerdfont-complete
    typeset -g POWERLEVEL9K_DISABLE_HOT_RELOAD=true
    typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_GAP_CHAR='-'
    typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_GAP_FOREGROUND=000

    #[ prompt_char: prompt symbol ]#
    typeset -g POWERLEVEL9K_PROMPT_CHAR_BACKGROUND=
    typeset -g POWERLEVEL9K_PROMPT_CHAR_OK_{VIINS,VICMD,VIVIS,VIOWR}_FOREGROUND=76
    typeset -g POWERLEVEL9K_PROMPT_CHAR_ERROR_{VIINS,VICMD,VIVIS,VIOWR}_FOREGROUND=196
    typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIINS_CONTENT_EXPANSION='❯'
    typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VICMD_CONTENT_EXPANSION='❮'
    typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIVIS_CONTENT_EXPANSION='Ⅴ'
    typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIOWR_CONTENT_EXPANSION='▶'
    typeset -g POWERLEVEL9K_PROMPT_CHAR_OVERWRITE_STATE=true
    typeset -g POWERLEVEL9K_PROMPT_CHAR_LEFT_PROMPT_LAST_SEGMENT_END_SYMBOL=
    typeset -g POWERLEVEL9K_PROMPT_CHAR_LEFT_{LEFT,RIGHT}_WHITESPACE=

    #[ dir: current directory ]#
    typeset -g POWERLEVEL9K_SHORTEN_STRATEGY=truncate_to_unique
    typeset -g POWERLEVEL9K_DIR_ANCHOR_FOREGROUND=232
    typeset -g POWERLEVEL9K_DIR_ANCHOR_BOLD=true
    local anchor_files=(
        .bzr
        .citc
        .git
        .hg
        .node-version
        .python-version
        .ruby-version
        .shorten_folder_marker
        .svn
        .terraform
        CVS
        Cargo.toml
        composer.json
        go.mod
        package.json
    )
    typeset -g POWERLEVEL9K_SHORTEN_FOLDER_MARKER="(${(j:|:)anchor_files})"
    typeset -g POWERLEVEL9K_DIR_MAX_LENGTH=80
    typeset -g POWERLEVEL9K_DIR_HYPERLINK=true
    # DIR_WRITABLE has nicer not-writable icon style than DIR_NOT_WRITABLE.
    typeset -g POWERLEVEL9K_DIR_SHOW_WRITABLE=false
    typeset -g POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_VISUAL_IDENTIFIER_EXPANSION=$'\uF50A '

    #[ vcs: git status ]#
    typeset -g POWERLEVEL9K_VCS_{STAGED,UNSTAGED,UNTRACKED,CONFLICTED,COMMITS_AHEAD,COMMITS_BEHIND}_MAX_NUM=-1

    #[ status: exit code of the last command ]#
    typeset -g POWERLEVEL9K_STATUS_EXTENDED_STATES=true
    typeset -g POWERLEVEL9K_STATUS_OK=false
    typeset -g POWERLEVEL9K_STATUS_ERROR=false
    typeset -g POWERLEVEL9K_STATUS_ERROR_SIGNAL=true
    typeset -g POWERLEVEL9K_STATUS_VERBOSE_SIGNAME=false
    typeset -g POWERLEVEL9K_STATUS_ERROR_SIGNAL_VISUAL_IDENTIFIER_EXPANSION='✘'
    typeset -g POWERLEVEL9K_STATUS_OK_PIPE=true
    typeset -g POWERLEVEL9K_STATUS_OK_PIPE_VISUAL_IDENTIFIER_EXPANSION='✔'
    typeset -g POWERLEVEL9K_STATUS_ERROR_PIPE=true
    typeset -g POWERLEVEL9K_STATUS_ERROR_PIPE_VISUAL_IDENTIFIER_EXPANSION='✘'

    #[ command_execution_time: duration of the last command ]#
    typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND=0
    typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND=3
    typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=3
    typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_PRECISION=0
    typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_FORMAT='d h m s'

    #[ background_jobs: presence of background jobs ]#
    typeset -g POWERLEVEL9K_BACKGROUND_JOBS_VERBOSE=false
    typeset -g POWERLEVEL9K_BACKGROUND_JOBS_VISUAL_IDENTIFIER_EXPANSION='${P9K_VISUAL_IDENTIFIER}'

    #[ vim_shell: vim shell indicator (:sh) ]#
    typeset -g POWERLEVEL9K_VIM_SHELL_VISUAL_IDENTIFIER_EXPANSION='${P9K_VISUAL_IDENTIFIER}'

    #[ context: user@hostname ]#
    typeset -g POWERLEVEL9K_CONTEXT_ROOT_FOREGROUND=1
    typeset -g POWERLEVEL9K_CONTEXT_ROOT_BACKGROUND=0
    typeset -g POWERLEVEL9K_CONTEXT_{REMOTE,REMOTE_SUDO}_FOREGROUND=3
    typeset -g POWERLEVEL9K_CONTEXT_{REMOTE,REMOTE_SUDO}_BACKGROUND=0
    typeset -g POWERLEVEL9K_CONTEXT_FOREGROUND=3
    typeset -g POWERLEVEL9K_CONTEXT_BACKGROUND=0
    typeset -g POWERLEVEL9K_CONTEXT_ROOT_TEMPLATE='%n@%m'
    typeset -g POWERLEVEL9K_CONTEXT_{REMOTE,REMOTE_SUDO}_TEMPLATE='%n@%m'
    typeset -g POWERLEVEL9K_CONTEXT_TEMPLATE='%n@%m'

    #[ anaconda: conda environment (https://conda.io/) ]#
    typeset -g POWERLEVEL9K_ANACONDA_SHOW_PYTHON_VERSION=false
    typeset -g POWERLEVEL9K_ANACONDA_{LEFT,RIGHT}_DELIMITER=

    #[ goenv: go environment (https://github.com/syndbg/goenv) ]#
    typeset -g POWERLEVEL9K_GOENV_PROMPT_ALWAYS_SHOW=false

    #[ nodenv: node.js version from nodenv (https://github.com/nodenv/nodenv) ]#
    typeset -g POWERLEVEL9K_NODENV_PROMPT_ALWAYS_SHOW=false

    #[ nodeenv: node.js environment (https://github.com/ekalinin/nodeenv) ]#
    typeset -g POWERLEVEL9K_NODEENV_SHOW_NODE_VERSION=false
    typeset -g POWERLEVEL9K_NODEENV_{LEFT,RIGHT}_DELIMITER=

    #[ node_version: node.js version ]#
    typeset -g POWERLEVEL9K_NODE_VERSION_PROJECT_ONLY=true

    #[ go_version: go version (https://golang.org) ]#
    typeset -g POWERLEVEL9K_GO_VERSION_PROJECT_ONLY=true

    #[ rust_version: rustc version (https://www.rust-lang.org) ]#
    typeset -g POWERLEVEL9K_RUST_VERSION_PROJECT_ONLY=true

    #[ dotnet_version: .NET version (https://dotnet.microsoft.com) ]#
    typeset -g POWERLEVEL9K_DOTNET_VERSION_PROJECT_ONLY=true

    #[ rbenv: ruby version from rbenv (https://github.com/rbenv/rbenv) ]#
    typeset -g POWERLEVEL9K_RBENV_SOURCES=(shell local global)
    typeset -g POWERLEVEL9K_RBENV_PROMPT_ALWAYS_SHOW=false

    #[ rvm: ruby version from rvm (https://rvm.io) ]#
    typeset -g POWERLEVEL9K_RVM_SHOW_GEMSET=false
    typeset -g POWERLEVEL9K_RVM_SHOW_PREFIX=false

    #[ jenv: java version from jenv (https://github.com/jenv/jenv) ]#
    typeset -g POWERLEVEL9K_JENV_SOURCES=(shell local global)
    typeset -g POWERLEVEL9K_JENV_PROMPT_ALWAYS_SHOW=false

    #[ kubecontext: current kubernetes context (https://kubernetes.io/) ]#
    typeset -g POWERLEVEL9K_KUBECONTEXT_SHOW_ON_COMMAND='kubectl|helm|kubens|kubectx|terraform'
    typeset -g POWERLEVEL9K_KUBECONTEXT_CLASSES=(
        '*'       DEFAULT
    )
    typeset -g POWERLEVEL9K_KUBECONTEXT_DEFAULT_FOREGROUND=088
    typeset -g POWERLEVEL9K_KUBECONTEXT_DEFAULT_BACKGROUND=4
    typeset -g POWERLEVEL9K_KUBECONTEXT_DEFAULT_CONTENT_EXPANSION=
    POWERLEVEL9K_KUBECONTEXT_DEFAULT_CONTENT_EXPANSION+='${P9K_KUBECONTEXT_CLOUD_CLUSTER:-${P9K_KUBECONTEXT_NAME}}'
    POWERLEVEL9K_KUBECONTEXT_DEFAULT_CONTENT_EXPANSION+='${${:-/$P9K_KUBECONTEXT_NAMESPACE}:#/default}'

    #[ vpn_ip: virtual private network indicator ]#
    typeset -g POWERLEVEL9K_VPN_IP_CONTENT_EXPANSION=
    typeset -g POWERLEVEL9K_VPN_IP_INTERFACE='(wg|(.*tun))[0-9]*'
    typeset -g POWERLEVEL9K_VPN_IP_VISUAL_IDENTIFIER_EXPANSION='VPN'

    #[ time: current time ]#
    typeset -g POWERLEVEL9K_TIME_VISUAL_IDENTIFIER_EXPANSION=

###############################################################################
#                        End of powerlevel10k settings                        #
###############################################################################

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=7

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

HIST_STAMPS="dd.mm.yyyy"

plugins=(
    tig
    git-flow
    docker
    docker-compose
    python
    pip
    autopep8
    pep8
    colored-man-pages
    tmux
    ubuntu
    zsh-completions
    conda-zsh-completion
)

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

  autoload -Uz compinit
  compinit
fi

source ~/.oh-my-zsh/oh-my-zsh.sh

# https://medium.com/@dannysmith/little-thing-2-speeding-up-zsh-f1860390f92
# Turns out that compinit is ZSH checking the cached .zcompdump to see if
# it needs regenerating. The simplest fix is to only do that once a day.
autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
    compinit
done
compinit -C

# Load all machine-specific or nonpublic aliases 
CONFIGS=`find ${ZSH_CUSTOM}/machine-specific -name '*.zsh'`
if [[ `echo -n ${CONFIGS} | wc -l` -ne 0 ]]
then
    for config_file in `find ${ZSH_CUSTOM}/machine-specific -name '*.zsh'`; do
        source "$config_file"
    done
fi

zstyle ":conda_zsh_completion:*" show-unnamed true
 
