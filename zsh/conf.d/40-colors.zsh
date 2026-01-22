### LS Colors (vivid)
if command -v vivid >/dev/null 2>&1; then
    export LS_COLORS="$(vivid generate catppuccin-mocha)"
fi

# Enable colors for ls and grep
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias diff='diff --color=auto'
