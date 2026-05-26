# MISE INITIALIZATION
# -------------------
# - Loaded early as dependent tools (starship, fzf, zoxide) need mise PATHs.

if command -v mise >/dev/null 2>&1; then
    local MISE_CACHE="$ZSH_CACHE_DIR/mise-init.zsh"
    if [[ ! -f "$MISE_CACHE" ]]; then
        mise activate zsh >| "$MISE_CACHE"
    fi
    source "$MISE_CACHE"
fi
