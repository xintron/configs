bindkey -e

bindkey "^P" history-beginning-search-backward
bindkey "^N" history-beginning-search-forward

bindkey "^[[Z" reverse-menu-complete

bindkey -M listscroll "^I" accept-search

bindkey -M vicmd v edit-command-line
bindkey "^X^E" edit-command-line
bindkey -M vicmd K run-help
