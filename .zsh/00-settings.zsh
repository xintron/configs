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

setopt extended_glob
setopt brace_ccl # Nifty stuff like {a-z} to complement {1..15}
setopt auto_cd
setopt prompt_subst

# Load libraries
for f in $ZSH_HOME/lib/*.zsh; do
    [[ $DEBUG -gt 0 ]] && echo "zsh: sourcing library $f"
    source $f
done
