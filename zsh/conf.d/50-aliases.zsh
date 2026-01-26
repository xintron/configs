### Aliases

# Git
alias g='git'
alias gs='git status --short --branch'
alias gd='git diff'
alias gc='git commit --verbose'

# LazyGit
if command -v lazygit >/dev/null 2>&1; then
    alias lg='lazygit'
fi

# List (Use GNU ls on Linux, gls on macOS if available, else BSD ls)
if [[ -n "$IS_LINUX" ]]; then
    # GNU ls (native on Linux)
    alias ls='ls --color=auto --group-directories-first --human-readable'
elif command -v gls >/dev/null 2>&1; then
    # GNU ls via Homebrew coreutils (macOS)
    alias ls='gls --color=auto --group-directories-first --human-readable'
else
    # BSD ls: -G (colorize), -h (human-readable sizes)
    alias ls='ls -G -h'
fi
alias ll='ls -l'        # Long format
alias la='ls -l -a'     # Long format with hidden files
