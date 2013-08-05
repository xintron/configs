# Author: Marcus Carlsson <hi@xintron.se>

eval $(dircolors -b $HOME/.dircolors)

# Variables
ZSH_HOME=$HOME/.zsh
ZSH_THEME=minimal.theme

for f in $ZSH_HOME/[0-9][0-9]*.zsh; do
    [[ $DEBUG -gt 0 ]] && echo "zsh: sourcing $f"
    source $f
done
