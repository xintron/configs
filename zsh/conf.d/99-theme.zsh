### Starship (Must be last)
if command -v starship >/dev/null 2>&1; then
    local STARSHIP_CACHE="$ZSH_CACHE_DIR/starship-init.zsh"
    if [[ ! -f "$STARSHIP_CACHE" ]]; then
        starship init zsh >| "$STARSHIP_CACHE"
    fi
    source "$STARSHIP_CACHE"
fi
