# Resolve the real directory of this script (handling symlinks)
export ZSH_CONFIG_DIR=${${(%):-%x}:A:h}

# Source all modular configs in order
if [[ -d "$ZSH_CONFIG_DIR/conf.d" ]]; then
    for config in "$ZSH_CONFIG_DIR"/conf.d/*.zsh(N); do
        source "$config"
    done
fi
