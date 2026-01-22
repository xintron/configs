# ZSH Configuration

This directory contains a high-performance, modular ZSH configuration designed for speed (~15ms startup), portability and cleanliness.

## Architecture

The configuration is split into two main entry points:

1.  **`.zshenv`**: Handles environment variables and `PATH` setup. It runs on *every* shell invocation (even non-interactive ones).
2.  **`.zshrc`**: Handles interactive shell configuration. It acts as a loader that sources modular files from the `conf.d/` directory.

### Portability & Symlinks
The `.zshrc` automatically detects its own physical location (resolving symlinks) using `${${(%):-%x}:A:h}`. This means you can symlink it to `~/.zshrc` from anywhere, and it will correctly find the `conf.d/` directory relative to itself.

## Modular Structure (`conf.d/`)

Configuration files in `conf.d/` are sourced in alphabetical order. A numeric prefix convention is used to ensure dependencies are loaded correctly:

| Prefix | Category | Description |
| :--- | :--- | :--- |
| **00-09** | **Core** | Basic options, caching and `compinit` optimization. |
| **10-19** | **History** | History settings (size, file location and sync behavior). |
| **20-29** | **Completions** | Completion logic (e.g., `jj` completions). |
| **30-49** | **Tools & UI** | Tool initialization (`fzf`, `zoxide`) and colors (`vivid`). |
| **90-99** | **Themes** | Prompt themes (must come last to override previous settings). |

## Performance & Caching

To maintain peak startup performance (<20ms), this configuration aggressively caches expensive operations.

*   **Tool Initialization**: The startup scripts for `starship`, `zoxide`, `fzf` and `vivid` are generated once and stored in `~/.cache/zsh-config/` (or `$XDG_CACHE_HOME`). They are not regenerated on every shell startup.
*   **Completion**: `compinit` uses the `-C` flag (cache mode) to skip security checks on subsequent startups.
*   **Global Skip**: The system-wide `compinit` (often found in `/etc/zsh/zshrc` on Debian/Ubuntu) is disabled via `skip_global_compinit=1` in `.zshenv`.

### Clearing the Cache
If you update a tool (e.g., install a new version of `starship` or `jj`), you may need to clear the cache to regenerate the startup scripts.

Run the following function in your shell:
```zsh
zsh_cache_clear
```
This will remove all cached init scripts and the `.zcompdump` file, forcing a regeneration on the next shell start.

## PATH Management (`.zshenv`)

The `PATH` is managed in `.zshenv` using Zsh's unique array feature (`typeset -aU path`) to automatically prevent duplicates.

It uses the `(N)` (null glob) qualifier to **only add directories that actually exist**. This ensures the `PATH` remains clean and fast, regardless of the host machine.

## Installation

Symlink the core files to your home directory:

```bash
ln -sf ~/git/configs/zsh/.zshenv ~/.zshenv
ln -sf ~/git/configs/zsh/.zshrc ~/.zshrc
```
