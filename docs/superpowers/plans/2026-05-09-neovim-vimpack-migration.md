# Neovim `vim.pack` Migration Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Migrate the existing `lazy.nvim` configuration to native `vim.pack` (Neovim 0.12) in a modular, phased manner within the `./nvim` directory.

**Architecture:** Modular layout with `./nvim/init.lua` as entry point. Core settings in `lua/config/`, and plugin configurations in `lua/plugins/` (explicitly required). Native `vim.pack.add` is used for plugin management.

**Tech Stack:** Neovim 0.12, `vim.pack.add`, Lua.

---

### Task 1: Core Foundation

**Files:**
- Create: `nvim/init.lua`
- Create: `nvim/lua/config/options.lua`
- Create: `nvim/lua/config/keymaps.lua`
- Create: `nvim/lua/config/neovide.lua`

- [ ] **Step 1: Create `nvim/lua/config/options.lua`**
Migrate core options from `old-nvim/lua/config/options.lua`.

```lua
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local opt = vim.opt

opt.expandtab = true
opt.shiftround = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.termguicolors = true
opt.number = true
opt.relativenumber = true
opt.scrolloff = 5

vim.cmd("syntax on")
vim.cmd("filetype plugin on")

vim.diagnostic.config({
	virtual_text = true,
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "",
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.INFO] = "",
			[vim.diagnostic.severity.HINT] = "󰌵",
		},
	},
})
```

- [ ] **Step 2: Create `nvim/lua/config/keymaps.lua`**
Migrate general keymaps from `old-nvim/lua/config/keymaps.lua`. Note: some keymaps depend on plugins we haven't added yet; we'll keep them but they might error if triggered before those plugins are loaded.

```lua
local map = vim.keymap.set
local M = {}

M.setup = function()
	-- Navigation (via Snacks)
	map("n", "<leader><space>", function() require("snacks").picker.smart() end, { desc = "Smart Find Files" })
	map("n", "<leader>e", function() require("snacks").explorer() end, { desc = "File Explorer" })
	map("n", "<leader>ff", function() require("snacks").picker.files() end, { desc = "Find Files" })
	map("n", "<leader>fg", function() require("snacks").picker.grep() end, { desc = "Live Grep" })
	map("n", "<leader>fb", function() require("snacks").picker.buffers() end, { desc = "Find Buffers" })
	map("n", "<leader>fh", function() require("snacks").picker.help() end, { desc = "Help Tags" })
	map("n", "<leader>fk", function() require("snacks").picker.keymaps() end, { desc = "Keymaps" })
	map("n", "<leader>fd", function() require("snacks").picker.diagnostics() end, { desc = "Diagnostics" })
end

return M
```

- [ ] **Step 4: Create `nvim/init.lua` (Initial)**
Set up the loading sequence.

```lua
require("config.options")
require("config.neovide")

-- Keymaps setup (will be called after plugins are loaded later, but for now we can call it)
require("config.keymaps").setup()

-- Helper for github URLs
local gh = function(x) return "https://github.com/" .. x end

-- Placeholder for vim.pack.add
-- vim.pack.add({})
```

- [ ] **Step 5: Verify Core Foundation**
Run: `XDG_CONFIG_HOME=$(pwd) nvim`
Expected: Neovim starts without errors. `:set number?` returns `number`.

- [ ] **Step 6: Commit Phase 1**
```bash
git add nvim/
git commit -m "feat(nvim): phase 1 foundation (options, keymaps, neovide)"
```

---

### Task 2: UI & Theme

**Files:**
- Create: `nvim/lua/plugins/ui.lua`
- Modify: `nvim/init.lua`

- [ ] **Step 1: Create `nvim/lua/plugins/ui.lua`**
Set up colorschemes and lualine.

```lua
local M = {}

M.setup = function()
    -- Lualine
    require("lualine").setup()

    -- Catppuccin
    require("catppuccin").setup({
        background = {
            light = "latte",
            dark = "macchiato",
        },
    })

    -- Final colorscheme choice
    vim.cmd.colorscheme("tokyonight-moon")
end

return M
```

- [ ] **Step 2: Update `nvim/init.lua` with UI plugins**
Add plugins to `vim.pack.add` and require the UI module.

```lua
-- Add this to nvim/init.lua
local gh = function(x) return "https://github.com/" .. x end

vim.pack.add({
    gh("folke/tokyonight.nvim"),
    gh("catppuccin/nvim"),
    gh("nvim-lualine/lualine.nvim"),
    gh("nvim-tree/nvim-web-devicons"),
})

require("plugins.ui").setup()
```

- [ ] **Step 3: Verify UI**
Run: `XDG_CONFIG_HOME=$(pwd) nvim`
Expected: Neovim installs plugins, then starts with `tokyonight-moon` theme and lualine active.

- [ ] **Step 4: Commit Phase 2**
```bash
git add nvim/
git commit -m "feat(nvim): phase 2 UI (themes, lualine)"
```

---

### Task 3: Utils & Navigation

**Files:**
- Create: `nvim/lua/plugins/utils.lua`
- Modify: `nvim/init.lua`

- [ ] **Step 1: Create `nvim/lua/plugins/utils.lua`**
Set up `snacks.nvim` and `gitsigns`.

```lua
local M = {}

M.setup = function()
    -- snacks.nvim
    require("snacks").setup({
        explorer = { enabled = true, replace_netrw = true },
        picker = {
            enabled = true,
            sources = {
                files = { hidden = true },
                explorer = {
                    hidden = true,
                    ignored = true,
                    tree = true,
                },
            },
        },
    })

    -- gitsigns
    require("gitsigns").setup()
end

return M
```

- [ ] **Step 2: Update `nvim/init.lua` with Utils plugins**
Add plugins to `vim.pack.add` and require the Utils module.

```lua
-- Update vim.pack.add in nvim/init.lua
vim.pack.add({
    -- ... previous plugins ...
    gh("folke/snacks.nvim"),
    gh("lewis6991/gitsigns.nvim"),
})

require("plugins.utils").setup()
```

- [ ] **Step 3: Verify Utils**
Run: `XDG_CONFIG_HOME=$(pwd) nvim`
Expected: `<leader>e` opens the Snacks explorer, `<leader><space>` opens the smart picker.
- [ ] **Step 4: Commit Phase 3**
```bash
git add nvim/
git commit -m "feat(nvim): phase 3 utils (snacks.nvim, gitsigns)"
```

---

### Task 4: Treesitter & LSP

**Files:**
- Create: `nvim/lua/plugins/treesitter.lua`
- Create: `nvim/lua/plugins/lsp.lua`
- Modify: `nvim/init.lua`

- [ ] **Step 1: Create `nvim/lua/plugins/treesitter.lua`**
Set up Treesitter.

```lua
local M = {}

M.setup = function()
    require("nvim-treesitter.configs").setup({
        highlight = { enable = true },
        indent = { enable = true },
    })
end

return M
```

- [ ] **Step 2: Create `nvim/lua/plugins/lsp.lua`**
Set up native LSP config without Mason or specialized completion/formatting plugins.

```lua
local M = {}

M.setup = function()
    local lspconfig = require("lspconfig")

    vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(event)
            local opts = { buffer = event.buf }
            vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
            vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
            vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, opts)
            vim.keymap.set("n", "<F4>", vim.lsp.buf.code_action, opts)
        end,
    })

    -- Manual setup for lua_ls (assumes lua-language-server is in PATH)
    lspconfig.lua_ls.setup({
        settings = {
            Lua = {
                diagnostics = { globals = { "vim" } },
            },
        },
    })
end

return M
```

- [ ] **Step 3: Update `nvim/init.lua` with LSP/Treesitter plugins**
Add plugins to `vim.pack.add` and require the modules.

```lua
-- Update vim.pack.add in nvim/init.lua
vim.pack.add({
    -- ... previous plugins ...
    gh("nvim-treesitter/nvim-treesitter"),
    gh("neovim/nvim-lspconfig"),
})

require("plugins.treesitter").setup()
require("plugins.lsp").setup()
```

- [ ] **Step 4: Verify LSP & Treesitter**
Run: `XDG_CONFIG_HOME=$(pwd) nvim nvim/init.lua`
Expected: Syntax highlighting is active, `:LspInfo` shows `lua_ls` attached (if installed on system).

- [ ] **Step 5: Commit Phase 4**
```bash
git add nvim/
git commit -m "feat(nvim): phase 4 treesitter and native lsp"
```

---

### Final Cleanup
- [ ] **Step 1: Remove `old-nvim` directory**
```bash
rm -rf old-nvim
```
- [ ] **Step 2: Final Verification**
Run: `XDG_CONFIG_HOME=$(pwd) nvim`
Verify everything is working as expected.

- [ ] **Step 3: Commit Cleanup**
```bash
git commit -am "cleanup: remove old-nvim after successful migration"
```
**
```bash
git commit -am "cleanup: remove old-nvim after successful migration"
```
