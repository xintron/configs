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

# Safety (Interactive mode)
alias cp='cp --interactive --verbose'
alias mv='mv --interactive --verbose'
alias rm='rm -I' # Prompts if deleting more than 3 files or recursive

# List
alias ls='ls --color=auto --group-directories-first --human-readable'
alias ll='ls -l'
alias la='ls -l --all'
