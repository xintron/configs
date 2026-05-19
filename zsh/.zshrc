# ZSH_CONFIG_DIR is already set by .zshenv

# Source machine-local overrides before shared config
[ -f "$HOME/.zshrc.local" ] && source "$HOME/.zshrc.local"

# Source all modular configs in order
if [[ -d "$ZSH_CONFIG_DIR/conf.d" ]]; then
    for config in "$ZSH_CONFIG_DIR"/conf.d/*.zsh(N); do
        source "$config"
    done
fi
