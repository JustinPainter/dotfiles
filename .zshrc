ulimit -n 65536
ulimit -u 2048

#!/bin/zsh
# shortcut to this dotfiles path is $ZSH
export ZSH="$HOME/.dotfiles"



# all of our zsh files
# typeset -U config_files
# config_files=($ZSH/*/*.zsh)

# load the path files
#for file in ${(M)config_files:#*/path.zsh}; do
#  source "$file"
#done

# export ZSH=/Users/$USER/.oh-my-zsh
source <(antibody init)

source ~/.zsh/exports.zsh
source "`brew --prefix`/etc/grc.bashrc"
zle -N deer
bindkey '\ek' deer

# Enable shims and autocompletion
if which nodenv > /dev/null; then eval "$(nodenv init -)"; fi
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
# if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
if which direnv > /dev/null; then eval "$(direnv hook zsh)"; fi

# source ~/.zsh/checks.zsh
# source ~/.zsh/colors.zsh
# source ~/.zsh/setopt.zsh
# source ~/.zsh/exports.zsh
# source ~/.zsh/prompt.zsh
# source ~/.zsh/completion.zsh
# source ~/.zsh/aliases.zsh
# source ~/.zsh/bindkeys.zsh
# source ~/.zsh/functions.zsh
# source ~/.zsh/history.zsh
# source ~/.zsh/zsh_hooks.zsh
# source  ${HOME}/.dotfiles/z/z.sh

# Don't check mail when opening terminal.
unset MAILCHECK

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="afowler"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to disable bi-weekly update prompts and just auto-update automatically.
# DISABLE_UPDATE_PROMPT=true

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="false"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(brew brew-cask gem jsontools npm zsh_reload)

# source $ZSH/oh-my-zsh.sh
# zstyle ':completion:*' use-cache yes

source ~/.zsh/aliases.zsh

# test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

autoload zmv
autoload -U deer

# From http://dotfiles.org/~_why/.zshrc
# Sets the window title nicely no matter where you are
title() {
  # escape '%' chars in $1, make nonprintables visible
  a=${(V)1//\%/\%\%}

  # Truncate command, and join lines.
  a=$(print -Pn "%40>...>$a" | tr -d "\n")

  case $TERM in
  screen)
    print -Pn "\ek$a:$3\e\\" # screen title (in ^A")
    ;;
  xterm*|rxvt)
    print -Pn "\e]2;$2\a" # plain xterm title ($3 for pwd)
    ;;
  esac
}

PURE_CMD_MAX_EXEC_TIME=1
PURE_PROMPT_SYMBOL='➜'
antibody bundle mafredri/zsh-async
antibody bundle justinpainter/pure
#antibody bundle sindresorhus/pure

__reload_dotfiles() {
  PATH="$(command -p getconf PATH):/usr/local/bin"
  # shellcheck disable=SC1090
  . ~/.zshrc
  cd . || return 1
}
alias reload!='__reload_dotfiles'


# these two guys **MUST** be loaded last.
antibody bundle <<EOF
  zsh-users/zsh-syntax-highlighting
  zsh-users/zsh-history-substring-search
EOF
