### Interactive Tools

# FZF
if command -v fzf >/dev/null 2>&1; then
    local FZF_CACHE="$ZSH_CACHE_DIR/fzf-init.zsh"
    if [[ ! -f "$FZF_CACHE" ]]; then
        fzf --zsh >| "$FZF_CACHE"
    fi
    source "$FZF_CACHE"
fi

# zoxide for faster dir jumping
if command -v zoxide >/dev/null 2>&1; then
    local ZOXIDE_CACHE="$ZSH_CACHE_DIR/zoxide-init.zsh"
    if [[ ! -f "$ZOXIDE_CACHE" ]]; then
        zoxide init zsh >| "$ZOXIDE_CACHE"
    fi
    source "$ZOXIDE_CACHE"
fi

# SDKMAN - autoloaded on first use
if [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]]; then
    autoload -Uz sdk
fi
