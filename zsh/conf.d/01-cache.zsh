# Clear zsh cache
zsh_cache_clear() {
    rm -rf "$ZSH_CACHE_DIR"
    # Also clear zcompdump
    rm -f ${ZDOTDIR:-$HOME}/.zcompdump*
    echo "Zsh cache cleared. Restart shell to regenerate."
}
