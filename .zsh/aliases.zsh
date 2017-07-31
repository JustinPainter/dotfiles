alias reload="source ~/.zshrc"

# Aliase for pcregrep
alias pgrep="pcregrep"

# RTC CLI shortcut
alias rtc="lscm"

# Provide a shortcut to edit .zshrc
alias zshconfig="code-insiders -n ~/.zshrc"
alias zshenvconfig="code-insiders -n ~/.zshenv"

# Alias code-insiders to code so we always use the latest and greatest
# alias code="code-insiders"

# Establish some safety nets
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'

# Provide some shortcuts for copy & paste
alias cb='pbcopy'
alias pb='pbpaste'

# Use coreutils find instead of system find
alias find='gfind'

# Alias env command to sort alphabetically
alias env='env | sort'
alias bk="bindkey | sort"
alias findkey="bindkey | grep"

# Use coreutils ls and give it a make-over
alias l='gls -1AGh | sort | colorit'
alias ll='gls -lAGh'
alias ls='gls -GFAh --color'
alias lsdot='gls -FAh | egrep "^\." | colorit'

# Try to minimize navigation frustration
alias b='cd -'
alias .='cd .'
alias ..='cd ..'
alias cd-='cd -'
alias cd..='cd ..'
# alias ..='cd ..'
# alias ...='cd ../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

# Shorten "yadm" to "yad" (three characters, like "git")
alias yad='yadm'
alias ani='antibody'

# Start calculator with math support
alias calc='bc -l'

# Create nested directories verbosly
alias mkdir='mkdir -pv'

# Set Kaleidoscope as the default diff viewer
alias diff='ksdiff'

## Shortcuts
alias hist='history'
alias path='echo -e ${PATH//:/\\n} | sort'

# alias nw=/Users/$USER/.nodenv/shims/nw
alias rp=realpath
#alias reload=src
alias c='clear'
alias cls='clear'

# Shortcut to projects
alias projects='~/Projects'

# Get my address
alias ip=myip

# Make things execute, damnit
alias addx='chmod +x'

# Make things not execute
alias remx='chmod -x'

# Always do -j because we don't want to change anything
alias date='date -j'

# Grab the time of day
# hrmin=$(date -j +"%I:%M")

# # Pretty print the time of day
# if (($(date +"%H") > 11))
# then
#   TIME="${hrmin}pm"
# else
#   TIME="${hrmin}am"
# fi

# Setup some time and date shortcuts
# alias _fulldate='date +"%B, %d, %G"'
# alias _date='date +"%m-%d-%Y"'
# alias _time='echo $TIME'
# alias _day='date -j +"%A"'
# alias _week='date -j +"%U"'
# alias _month='date -j +"%B"'
# alias _year='date -j +"%G"'

# Export the time to the environment
# export TIME
