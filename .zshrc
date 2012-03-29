# Author: Marcus Carlsson <hi@xintron.se>

eval $(dircolors -b $HOME/.dircolors)

for f in $HOME/.zsh/*.zsh; do
    if [[ $DEBUG > 0 ]]; then
        echo "zsh: sourcing $f"
    fi
    source $f
done

export TZ='Europe/Stockholm'
