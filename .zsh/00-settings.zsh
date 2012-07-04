set -o vi

export TZ='Europe/Stockholm'
export EDITOR="vim"
export PATH=$HOME/bin:$PATH
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
autoload -U predict-on
zle -N predict-on
zle -N predict-off
predict-on

setopt extended_glob
setopt brace_ccl # Nifty stuff like {a-z} to complement {1..15}
setopt auto_cd
setopt auto_pushd
setopt pushd_silent
setopt prompt_subst
setopt hash_cmds
setopt auto_list

# Load libraries
for f in $ZSH_HOME/lib/*.zsh; do
    [[ $DEBUG -gt 0 ]] && echo "zsh: sourcing library $f"
    source $f
done
