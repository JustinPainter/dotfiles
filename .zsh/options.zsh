## ===== Basics
setopt NO_BEEP # don't beep on error
setopt NO_BG_NICE
# setopt interactive_comments # Allow comments even in interactive shells (especially for Muness)

## ===== Changing Directories
# setopt auto_cd # If you type foo, and it isn't a command, and it is a directory in your cdpath, go there
# setopt cdablevarS # if argument to cd is the name of a parameter whose value is a valid directory, it will become the current directory
setopt PUSHD_IGNORE_DUPS # don't push multiple copies of the same directory onto the directory stack

## ===== Expansion and Globbing
setopt EXTENDED_GLOB # treat #, ~, and ^ as part of patterns for filename generation

## ===== History
# setopt APPEND_HISTORY # Allow multiple terminal sessions to all append to one zsh command history
# setopt extended_history # save timestamp of command and duration
setopt INC_APPEND_HISTORY # Add comamnds as they are typed, don't wait until shell exit
setopt HIST_EXPIRE_DUPS_FIRST # when trimming history, lose oldest duplicates first
# setopt hist_ignore_dups # Do not write events to history that are duplicates of previous events
setopt HIST_IGNORE_SPACE # remove command line from history list when first character on the line is a space
# setopt HIST_FIND_NO_DUPS # When searching history don't display results already cycled through twice
setopt HIST_REDUCE_BLANKS # Remove extra blanks from each command line being added to history

#Whenever the user enters a line with history expansion, don’t execute the line directly; instead, perform history expansion and reload the line into the editing buffer.
setopt HIST_VERIFY

# setopt SHARE_HISTORY # imports new commands and appends typed commands to history

## ===== Completion
unsetopt MENU_COMPLETE # do not autoselect the first completion entry
setopt ALWAYS_TO_END # When completing from the middle of a word, move the cursor to the end of the word
setopt AUTO_MENU # show completion menu on successive tab press. needs unsetop menu_complete to work
# setopt auto_name_dirs # any parameter that is set to the absolute name of a directory immediately becomes a name for that directory
setopt COMPLETE_IN_WORD # Allow completion from within a word/phrase



## ===== Correction
#setopt correct # spelling correction for commands
#setopt correctall # spelling correction for arguments

## ===== Prompt
setopt PROMPT_SUBST # Enable parameter expansion, command substitution, and arithmetic expansion in the prompt
#setopt transient_rprompt # only show the rprompt on the current prompt

## ===== Scripts and Functions
#setopt multios # perform implicit tees or cats when multiple redirections are attempted
