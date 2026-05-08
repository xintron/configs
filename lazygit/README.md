# 🦥 Lazygit Config

## Setup

Symlink this directory to make the config active:

```bash
ln -sf /path/to/configs/lazygit ~/.config/lazygit
```

Replace `/path/to/configs/lazygit` with the actual path to this directory.

**Verify:**
```bash
ls -la ~/.config/lazygit
```

Should point to your configs repo.

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
