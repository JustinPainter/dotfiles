#!/bin/zsh

# Set a nice window title no matter where we are
title() {
  # escape '%' chars in $1, make nonprintables visible
  a=${(V)1//\%/\%\%}

  # Truncate command, and join lines.
  a=$(print -Pn "%40>...>$a" | tr -d "\n")

  case $TERM in screen)
    print -Pn "\ek$a:$3\e\\"
    ;;
  xterm*|rxvt)
    print -Pn "\e]2;$2\a"
    ;;
  esac 
}
