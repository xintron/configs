export HISTSIZE=100000
export SAVEHIST=100000
setopt EXTENDED_HISTORY
setopt autocd
autoload -U compinit; compinit

### Interactive Tools & Completions

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# zoxide for faster dir jumping
if command -v zoxide >/dev/null 2>&1; then
    eval "$(zoxide init zsh)"
fi

### Completions

# JJ
if command -v jj >/dev/null 2>&1; then
    source <(COMPLETE=zsh jj)
fi

### Starship (Must be last)
if command -v starship >/dev/null 2>&1; then
    eval "$(starship init zsh)"
fi
