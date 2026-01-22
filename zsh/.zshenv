export EDITOR='nvim'
export VISUAL='nvim'
# Skip global compinit to speed up startup (it's called in .zshrc)
export skip_global_compinit=1

### Paths

# Use zsh path array for cleaner management and deduplication
typeset -aU path

# Prepend important local bins only if they exist
path=(
    "$HOME/.local/bin"(N)
    "$HOME/.opencode/bin"(N)
    "$HOME/.fzf/bin"(N)
    "$HOME/go/bin"(N)
    "/usr/local/go/bin"(N)
    "/snap/bin"(N)
    $path[@]
)

# bun
if [[ -d "$HOME/.bun" ]]; then
    export BUN_INSTALL="$HOME/.bun"
    path=( "$BUN_INSTALL/bin"(N) $path[@] )
fi

### Environment & Source

# Cargo
[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"
