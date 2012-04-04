# Author: Marcus Carlsson <hi@xintron.se>

eval $(dircolors -b $HOME/.dircolors)

# Variables
ZSH_HOME=$HOME/.zsh
ZSH_THEME=xintron.theme

for f in $HOME/.zsh/[0-9][0-9]*.zsh; do
    if [[ $DEBUG > 0 ]]; then
        echo "zsh: sourcing $f"
    fi
    source $f
done
