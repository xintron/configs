# Author: Marcus Carlsson <hi@xintron.se>

eval $(dircolors -b $HOME/.dircolors)

# Variables
ZSH_HOME=$HOME/.zsh
ZSH_THEME=xintron.theme

# Load colors before we source all config-files that might use them
autoload -U colors
colors
autoload -U zsh/complist

for f in $HOME/.zsh/[0-9][0-9]*.zsh; do
    if [[ $DEBUG > 0 ]]; then
        echo "zsh: sourcing $f"
    fi
    source $f
done

export TZ='Europe/Stockholm'

autoload -U compinit
compinit -i
