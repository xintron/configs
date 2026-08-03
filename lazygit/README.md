# 🦥 Lazygit Config

## Setup

Managed via `mise dotfiles apply` - see the root [README](../README.md).

## Theme (Catppuccin Macchiato)

The theme is loaded from [catppuccin/lazygit](https://github.com/catppuccin/lazygit). It's cloned via `mise dotfiles apply` to `~/git/catppuccin/lazygit`.

The `LG_CONFIG_FILE` env var in `.zshenv` merges the base config with the theme file automatically. If the repo isn't cloned, lazygit falls back to the default config.

---

**Platform paths:**
- macOS: `~/.config/lazygit/config.yml`
- Linux: `~/.config/lazygit/config.yml`
- Windows: `%LOCALAPPDATA%\lazygit\config.yml`
