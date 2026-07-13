# Dotfiles

## Setup

    git clone <repo-url> ~/git/configs
    cd ~/git/configs
    mise dotfiles apply

Applies all managed symlinks (see `[dotfiles]` in `mise/config.toml`). Safe to re-run; check status without changing anything:

    mise dotfiles status
