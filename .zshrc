#!/bin/zsh

# Open up OS X's restrictive open file limit
ulimit -n 65536
ulimit -u 2048
unsetopt MULTIBYTE

# shortcut to this dotfiles path is $ZSH
export ZSH="$HOME/.zsh"

# all of our zsh files
# typeset -U config_files
# config_files=($ZSH/*/*.zsh)

# load the path files
#for file in ${(M)config_files:#*/path.zsh}; do
#  source "$file"
#done

# Source and initialize antibody for managing zsh plugins
source <(antibody init)

# Source GRC for pretty colors
source "`brew --prefix`/etc/grc.bashrc"

# Values for TERMINAL_PROGRAM
#  iTerm.app
#  Terminal-Plus
#  Apple_Terminal

# Set alias for listing utilities I often forget about
set -A UTILS buku, jo, mas, mlr, httpie, yadm
alias utils='echo $UTILS'

# Enable shims for virtual environments
if which direnv > /dev/null; then eval "$(direnv hook zsh)"; fi
if which nodenv > /dev/null; then eval "$(nodenv init -)"; fi
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# source ~/.zsh/checks.zsh
# source ~/.zsh/colors.zsh
# source ~/.zsh/window.zsh
source ~/.zsh/options.zsh
source ~/.zsh/colors.zsh
# source ~/.zsh/prompt.zsh
source ~/.zsh/completion.zsh
source ~/.zsh/bindkeys.zsh
# source ~/.zsh/functions.zsh
# source ~/.zsh/history.zsh
# source ~/.zsh/zsh_hooks.zsh
# source  ${HOME}/.dotfiles/z/z.sh

# Stop checking mail when opening terminal.
unset MAILCHECK

source ~/.zsh/aliases.zsh

# Load the zmv file renaming utility
autoload zmv

# Load the deer zle file browser widget
autoload -U deer

# Bind deer to the zle line editor
zle -N deer

# Bind alt-k to deer
bindkey '\ek' deer

# Configure pure prompt
PURE_CMD_MAX_EXEC_TIME=1
PURE_PROMPT_SYMBOL=➜

# Load antibody bundles
antibody bundle mafredri/zsh-async
antibody bundle justinpainter/pure
ani bundle zsh-users/zsh-completions

__reload_dotfiles() {
  PATH="$(command -p getconf PATH):/usr/local/bin"
  . ~/.zshrc
  cd . || return 1
}

alias reload!='__reload_dotfiles'

# iTerm2 integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# load every completion after autocomplete loads
for file in ${(M)config_files:#*/completion.zsh}; do
  source "$file"
done

# Load highlighting and history search
# Must be dead last
antibody bundle <<EOF
  zsh-users/zsh-syntax-highlighting
  zsh-users/zsh-history-substring-search
EOF

autoload zkbd
