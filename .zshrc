#!/bin/zsh

# Install and configure hombrew via homebrew-file
# curl -fsSL https://raw.github.com/rcmdnk/homebrew-file/install/install.sh |sh

# Open up OS X's restrictive open file limit
ulimit -n 65536
ulimit -u 2048

# shortcut to this dotfiles path is $ZSH
export ZSH="$HOME/.zsh"
export PATH=/usr/local/opt/openssl/bin:/usr/local/opt/go/libexec/bin:$HOME/Library/Jazz/scmtools/eclipse:/usr/local/sbin:$HOME/bin:$HOME/.nodenv/bin:$JAVA_HOME/bin:/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin:$PATH

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

# Set alias for listing utilities I often forget about
set -A UTILS buku, deer, jo, mackup, mas, mlr, httpie, yadm
alias utils='echo $UTILS'

# source ~/.zsh/colors.zsh
# source ~/.zsh/window.zsh
source ~/.zsh/options.zsh
source ~/.zsh/colors.zsh
# source ~/.zsh/completion.zsh
source ~/.zsh/bindkeys.zsh
# source ~/.zsh/functions.zsh
source ~/.zsh/aliases.zsh

autoload zmv
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
# antibody bundle zsh-users/zsh-completions

__reload_dotfiles() {
  PATH="$(command -p getconf PATH):/usr/local/bin"
  . ~/.zshrc
  cd . || return 1
}

# iTerm2 integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

if [ -f $(brew --prefix)/etc/brew-wrap ];then
  source $(brew --prefix)/etc/brew-wrap
fi

# Source Python virtual environment wrapper
source /usr/local/bin/virtualenvwrapper.sh

echo $ECLIPSE_WORKSPACE

# Enable shims for virtual environments
if which direnv > /dev/null; then eval "$(direnv hook zsh)"; fi
if which nodenv > /dev/null; then eval "$(nodenv init -)"; fi
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
if which ssh-agent > /dev/null; then eval "$(ssh-agent -s)"; fi

# if [ -e "$HOME/.ssh/id_rsa" ] ; then
#   ssh-add "$HOME/.ssh/id_rsa";
# fi

# Cloud Security Policy: It is only valid to use iot-deploy 
#   if performing a first time deployment

# if [ -e "$ECLIPSE_WORKSPACE/iotcloud.infrastructure.openstack.deploy/envs/$USER/ssh/id_rsa" ] ; then
# 	ssh-add "$ECLIPSE_WORKSPACE/workspace/iotcloud.infrastructure.openstack.deploy/envs/$USER/ssh/id_rsa";
# fi

# Add as many as you like. Use the -verify flag to check
#   that the paths are correct.

autoload -Uz compinit

typeset -i updated_at=$(date +'%j' -r ~/.zcompdump 2>/dev/null || stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)
if [ $(date +'%j') != $updated_at ]; then
  compinit
else
  compinit -C
fi

# Added by the Bluemix CLI
source /usr/local/Bluemix/bx/zsh_autocomplete

# load every completion after autocomplete loads
# for file in ${(M)config_files:#*/completion.zsh}; do
#   source "$file"
# done

# Load highlighting and history search
# Must be dead last
antibody bundle <<EOF
  zsh-users/zsh-syntax-highlighting
#   zsh-users/zsh-history-substring-search
EOF
