set -o vi

export TZ='Europe/Stockholm'
export EDITOR="vim"
if [ -n "$(command -v "vimpager")" ]; then
    export PAGER="vimpager"
elif [ -n "$(command -v "less")" ]; then
    export PAGER="less"
fi

# Load colors before we source all config-files that might use them
autoload -U colors
colors
autoload -U zsh/complist
autoload -U compinit
compinit -i

setopt extendedglob
