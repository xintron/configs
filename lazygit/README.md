# 🦥 Lazygit Config

## Setup

Managed via `mise dotfiles apply` - see the root [README](../README.md).

## Theme (Tokyo Night Moon)

The theme is loaded from [tokyonight.nvim](https://github.com/folke/tokyonight.nvim) extras. Clone it to `~/git/tokyonight.nvim`:

```bash
git clone https://github.com/folke/tokyonight.nvim ~/git/tokyonight.nvim
```

The `LG_CONFIG_FILE` env var in `.zshenv` merges the base config with the theme file automatically. If the repo isn't cloned, lazygit falls back to the default config.

---

**Platform paths:**
- macOS: `~/.config/lazygit/config.yml`
- Linux: `~/.config/lazygit/config.yml`
- Windows: `%LOCALAPPDATA%\lazygit\config.yml`
