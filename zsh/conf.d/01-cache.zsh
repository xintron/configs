# Define cache directory
export ZSH_CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/zsh-config"
[[ ! -d "$ZSH_CACHE_DIR" ]] && mkdir -p "$ZSH_CACHE_DIR"

# Clear zsh cache
zsh_cache_clear() {
    rm -rf "$ZSH_CACHE_DIR"/*
    # Also clear zcompdump
    rm -f ${ZDOTDIR:-$HOME}/.zcompdump*
    echo "Zsh cache cleared. Restart shell to regenerate."
}
