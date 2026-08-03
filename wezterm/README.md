# WezTerm Config

## Verifying changes

WezTerm has no test suite for Lua configs - use these commands to check changes before relying on them in a real session.

**Check the config loads without errors:**

```sh
wezterm --config-file wezterm/wezterm.lua ls-fonts
```

Any Lua syntax error or failed `require` will surface here.

**Inspect the resulting key bindings:**

```sh
wezterm --config-file wezterm/wezterm.lua show-keys --lua
```

Dumps every top-level binding (including WezTerm's built-in defaults) as Lua. Useful for confirming a new binding was added, or spotting an unintended collision with a default.

**Inspect a specific key table** (e.g. `pane_mode`, `tab_mode`):

```sh
wezterm --config-file wezterm/wezterm.lua show-keys --key-table pane_mode --lua
```

Note: `show-keys --lua` without `--key-table` does not reliably reflect custom key table contents - always pass `--key-table <name>` when checking `pane_mode`/`tab_mode` bindings specifically.

**Format Lua files:**

```sh
stylua wezterm/
```
