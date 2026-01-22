### Completions

# JJ Completion Caching
if command -v jj >/dev/null 2>&1; then
    local JJ_CACHE="$ZSH_CACHE_DIR/jj-completion.zsh"
    
    # Generate if missing
    if [[ ! -f "$JJ_CACHE" ]]; then
        COMPLETE=zsh jj >| "$JJ_CACHE"
    fi
    
    source "$JJ_CACHE"
fi
