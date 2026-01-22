export EDITOR='nvim'
export VISUAL='nvim'

### Paths

# Local bin
[ -d "$HOME/.local/bin" ] && export PATH="$HOME/.local/bin:$PATH"

# opencode
[ -d "$HOME/.opencode/bin" ] && export PATH="$HOME/.opencode/bin:$PATH"

# bun
if [ -d "$HOME/.bun" ]; then
    export BUN_INSTALL="$HOME/.bun"
    [ -d "$BUN_INSTALL/bin" ] && export PATH="$BUN_INSTALL/bin:$PATH"
fi

# Go
[ -d "/usr/local/go/bin" ] && export PATH="$PATH:/usr/local/go/bin"
[ -d "$HOME/go/bin" ] && export PATH="$PATH:$HOME/go/bin"

# Snap
[ -d "/snap/bin" ] && export PATH="$PATH:/snap/bin"

### Environment & Source

# Cargo
[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"
