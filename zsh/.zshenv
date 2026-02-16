export EDITOR='nvim'
export VISUAL='nvim'
# Skip global compinit to speed up startup (it's called in .zshrc)
export skip_global_compinit=1

### XDG Base Directory
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

### Zsh Function Path

# Resolve the real directory of this script (handling symlinks)
export ZSH_CONFIG_DIR=${${(%):-%x}:A:h}

# Add custom functions directory to fpath
fpath=("$ZSH_CONFIG_DIR/functions" $fpath)

### Paths

# Use zsh path array for cleaner management and deduplication
typeset -aU path

# Prepend important local bins only if they exist
path=(
    "$HOME/.local/share/mise/shims"(N)
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

### Local machine-specific overrides
[ -f "$HOME/.zshenv.local" ] && source "$HOME/.zshenv.local"
