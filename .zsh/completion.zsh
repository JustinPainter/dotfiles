#!/bin/zsh

# Force rehash when command not found
_force_rehash() {
  (( CURRENT == 1 )) && rehash
  return 1
}

# Forces zsh to realize new commands
zstyle ':completion:*' completer _oldlist _expand _force_rehash _complete _match _ignored _approximate

# Use case insensitive matching for lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# Prevent tabs from clipboard performing completions
zstyle ':completion:*' insert-tab pending

# menu if nb items > 2
zstyle ':completion:*' menu select=2
