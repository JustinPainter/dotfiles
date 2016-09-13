# Load colors function
autoload colors && colors

# Rename colors to something useful (this snippet won't work in OS X)
# for COLOR in RED GREEN YELLOW BLUE MAGENTA CYAN BLACK WHITE; do
#     eval $COLOR='%{$fg_no_bold[${(L)COLOR}]%}'  #wrap colours between %{ %} to avoid weird gaps in autocomplete
#     eval BOLD_$COLOR='%{$fg_bold[${(L)COLOR}]%}'
# done
# eval RESET='%{$reset_color%}'

# Detect 256 color support
# for COLOR in {0..255}
# do
#     for STYLE in "38;5"
#     do
#         TAG="\033[${STYLE};${COLOR}m"
#         STR="${STYLE};${COLOR}"
#         echo -ne "${TAG}${STR}${NONE}  "
#     done
#     echo
# done
