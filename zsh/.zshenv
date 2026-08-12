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
    "$HOME/.local/bin"(N)
    "/snap/bin"(N)
    $path[@]
)

### Environment & Source

# Cargo
[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"

_theme_path="$HOME/git/catppuccin"
# FZF
_fzf_theme="$_theme_path/fzf/themes/catppuccin-fzf-macchiato.sh"
[ -f "$_fzf_theme" ] && source "$_fzf_theme"

# Lazygit
_lg_theme="$_theme_path/lazygit/themes-mergable/macchiato/green.yml"
if [[ -f "$_lg_theme" ]]; then
    export LG_CONFIG_FILE="${XDG_CONFIG_HOME}/lazygit/config.yml,$_lg_theme"
fi
unset _lg_theme _fzf_theme _theme_path

### Zsh Cache
export ZSH_CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/zsh-config"
[[ ! -d "$ZSH_CACHE_DIR" ]] && mkdir -p "$ZSH_CACHE_DIR"

### Local machine-specific overrides
[ -f "$HOME/.zshenv.local" ] && source "$HOME/.zshenv.local"
