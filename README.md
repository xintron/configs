# Dotfiles

## Setup

    git clone <repo-url> ~/git/configs
    cd ~/git/configs
    mise bootstrap

Sets up the whole machine in order: repos (`[bootstrap.repos]`), dotfiles (`[dotfiles]`), tools (`[tools]`), then the `bootstrap` task, which installs and updates herdr plugins (see `herdr/tasks.toml`). Safe to re-run; preview without changing anything:

    mise bootstrap --dry-run

Individual steps are still available, e.g. only the symlinks (`mise dotfiles apply`, `mise dotfiles status`) or only the herdr plugins (`mise run herdr:plugins`).
