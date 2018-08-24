# Setting this to ~vim automatically enables vi-mode in ZSH.
export EDITOR="nvim"
# Therefor set the mode back to emacs before sourcing any other files
bindkey -e


[ -d $HOME/.gem/ruby/1.9.1/bin ] && PATH=$HOME/.gem/ruby/1.9.1/bin:$PATH
[ -d $HOME/.composer/vendor/bin/ ] && PATH=$HOME/.composer/vendor/bin:$PATH
[ -d $HOME/.cabal/bin/ ] && PATH=$HOME/.cabal/bin:$PATH
[ -d $HOME/git/utils ] && PATH=$HOME/git/utils:$PATH

# Setup ssh-agent variable
#(( $+commands[envoy] )) && source <(envoy -p)

export GOPATH=$HOME/go
[ -d $GOPATH/bin ] && PATH=$GOPATH/bin:$PATH

export PATH=$HOME/bin:$HOME/.local/bin:/usr/lib/ccache/bin:/usr/local/bin:$PATH
#[ $OSX -gt 0 ] && export PATH="$(brew --prefix homebrew/php/php55)/bin:$PATH"
export PAGER="less"

# Load completions
for d in $ZSH_HOME/completion/*(/); do
    [[ -d $d/src ]] && dir=$d/src || dir=$d
    [[ $DEBUG -gt 0 ]] && echo "zsh: adding dir to \$fpath $dir"
    fpath=($dir $fpath)
done

# Load colors before we source all config-files that might use them
autoload -U colors
colors
autoload -U compinit
compinit -i
zmodload zsh/complist
autoload edit-command-line
zle -N edit-command-line

setopt extended_glob
setopt brace_ccl # Nifty stuff like {a-z} to complement {1..15}
setopt auto_cd
setopt auto_pushd
setopt pushd_silent
setopt prompt_subst
setopt hash_cmds
setopt auto_list

# Virtualenv
if [ -f "/usr/local/bin/virtualenvwrapper.sh" -a $OSX -gt 0 ]; then
    export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
    export WORKON_HOME=$HOME/Envs
    source /usr/local/bin/virtualenvwrapper.sh
fi

# Load libraries
for f in $ZSH_HOME/lib/*.zsh; do
    [[ $DEBUG -gt 0 ]] && echo "zsh: sourcing library $f"
    source $f
done

[[ -f $ZSH_HOME/modules/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] && source $ZSH_HOME/modules/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Load support for fzf if it exists
[[ -f /usr/share/fzf/key-bindings.zsh ]] && source /usr/share/fzf/key-bindings.zsh
[[ -f $HOME/.fzf.zsh ]] && source $HOME/.fzf.zsh

# Load gistit token if available
[[ -f $HOME/.gistitrc ]] && source $HOME/.gistitrc

# Load NVM. This sadly adds a lot of load time but VSCode needs it
export NVM_DIR="$HOME/.nvm"
if [ -s "$NVM_DIR/nvm.sh" ]; then
    lnvm() {
        source $HOME/.nvm/nvm.sh
    }
fi

if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
fi