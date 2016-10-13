# Fill $PATH with useful things
#  coreutils       [/usr/local/opt/coreutils/libexec/gnubin]
#  bin for Go      [/usr/local/opt/go/libexec/bin]
#  scmtool for RTC [/Users/jlpainte/Library/Jazz/scmtools/eclipse]
#  local sbin      [/usr/local/sbin]
#  $HOME bin       [$HOME/bin]
export PATH=/usr/local/opt/go/libexec/bin:/Users/$USER/bin:$HOME/Library/Jazz/scmtools/eclipse:/usr/local/sbin:$HOME/bin:$HOME/.nodenv/bin:$PATH

# Configure shell history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# Put coreutiles manpages into $MANPATH
export MANPATH="/usr/local/man:/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

# Setup homebrew environment
#   Github API key for homebrew access
#   Homebrew Cask options
#   Text editor for homebrew to use
export HOMEBREW_GITHUB_API_TOKEN=b6683a34ffb4768a3d73026a4b6fa69c16cab012
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
export HOMEBREW_EDITOR="atom -n"
export BREWFILE="$HOME/.brewfile"
export CASKFILE="$HOME/.caskfile"

# Setup Go environment
export GOPATH=/Users/jlpainte/Projects/openblockchain/src
export GOROOT=/usr/local/opt/go

# Colorize the grep command output for ease of use (good for log files)##
export GREP_OPTIONS="--color=auto"
export GREP_COLOR='3;35'

# Configure Less to be less intrusive
#    -X [disable sending the termcap init and deinit strings to the terminal]
#    -F [auto exit if content will fit on screen]
#    -R [only ANSI "color" escape sequences are output in "raw" form]
export LESS="-XFR"

# Set editor environment variables
# export VISUAL='vi'
export EDITOR='atom -a'
export GIT_EDITOR='atom -n --safe --wait'

# set project folder that we can `p [tab]` to
export PROJECTS="$HOME/Projects"

# Compilation flags
export ARCHFLAGS="-arch x86_64"
export LD_LIBRARY_PATH=/Library/Java/JavaVirtualMachines/jdk1.8.0_65.jdk/Contents/Home/jre/bin
