### History settings
export HISTFILE=~/.zsh_history
# HISTSIZE: Maximum number of commands to keep in memory
export HISTSIZE=10000
# SAVEHIST: Maximum number of commands to save to file
export SAVEHIST=100000
# EXTENDED_HISTORY: Include timestamps and execution time in history
setopt EXTENDED_HISTORY
# HIST_IGNORE_DUPS: Don't save duplicate commands
setopt HIST_IGNORE_DUPS
# HIST_IGNORE_SPACE: Don't save commands starting with space
setopt HIST_IGNORE_SPACE
# INC_APPEND_HISTORY: Append each command to history file immediately
setopt INC_APPEND_HISTORY
# SHARE_HISTORY: Share history between all zsh sessions
setopt SHARE_HISTORY

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
