# MISE INITIALIZATION
# -------------------
# - Loaded early as dependent tools (starship, fzf, zoxide) need mise PATHs.
# - Uses 'hook-env' instead of 'activate' to avoid version re-evaluation on
#   directory changes.
# - Run 'zsh_cache_clear' after 'mise upgrade' to refresh.

if command -v mise >/dev/null 2>&1; then
    local MISE_CACHE="$ZSH_CACHE_DIR/mise-init.zsh"
    if [[ ! -f "$MISE_CACHE" ]]; then
        mise hook-env -s zsh >| "$MISE_CACHE"
    fi
    source "$MISE_CACHE"
fi
