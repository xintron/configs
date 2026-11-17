# Dotfiles

## Setup

    git clone <repo-url> ~/git/configs
    cd ~/git/configs
    mise bootstrap

Sets up the whole machine in order: repos (`[bootstrap.repos]`), dotfiles (`[dotfiles]`), tools (`[tools]`), then the `bootstrap` task, which installs and updates herdr plugins (see `herdr/tui/tasks.toml`). Safe to re-run; preview without changing anything:

    mise bootstrap --dry-run

Individual steps are still available, e.g. only the symlinks (`mise dotfiles apply`, `mise dotfiles status`) or only the herdr plugins (`mise run herdr:plugins`).

## Windows

Run `mise` from native PowerShell (not WSL) so `~` resolves to `%USERPROFILE%`.

1. **Enable Developer Mode** (`ms-settings:developers`) so `dotfiles.windows_symlinks = true` can create symlinks without Admin.
2. **Clone to `~/git/configs`** (`%USERPROFILE%\git\configs`) and run `mise bootstrap` from there.
