### LS Colors (vivid)
if command -v vivid >/dev/null 2>&1; then
    local VIVID_CACHE="$ZSH_CACHE_DIR/ls-colors.zsh"
    if [[ ! -f "$VIVID_CACHE" ]]; then
        echo "export LS_COLORS=\"$(vivid generate catppuccin-mocha)\"" >| "$VIVID_CACHE"
    fi
    source "$VIVID_CACHE"
fi

# Enable colors for ls and grep
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias diff='diff --color=auto'
