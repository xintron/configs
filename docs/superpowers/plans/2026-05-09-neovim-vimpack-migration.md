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
	-- Fuzzy file finder (fzf-lua)
	map("n", "<leader>ff", function() require("fzf-lua").files() end, { desc = "fzf files" })
	map("n", "<leader>fa", function() require("fzf-lua").global() end, { desc = "fzf global" })
	map("n", "<leader>fg", function() require("fzf-lua").live_grep() end, { desc = "fzf live grep" })
	map("n", "<leader>fb", function() require("fzf-lua").buffers() end, { desc = "fzf buffers" })
	map("n", "<leader>fh", function() require("fzf-lua").help_tags() end, { desc = "fzf help tags" })
	map("n", "<leader>fk", function() require("fzf-lua").keymaps() end, { desc = "fzf keymaps" })
	map("n", "<leader>fdd", function() require("fzf-lua").diagnostics_document() end, { desc = "fzf document diagnostics" })
	map("n", "<leader>fdw", function() require("fzf-lua").diagnostics_workspace() end, { desc = "fzf workspace diagnostics" })

	-- File explorer (neo-tree)
	map("n", "<leader>df", ":Neotree source=filesystem toggle=true<cr>", { desc = "Neo-tree files" })
	map("n", "<leader>db", ":Neotree source=buffers toggle=true<cr>", { desc = "Neo-tree buffers" })
	map("n", "<leader>dl", ":Neotree source=document_symbols toggle=true<cr>", { desc = "Neo-tree symbols" })

	-- Neogit
	map("n", "<leader>gg", ":Neogit<cr>", { desc = "Neogit" })
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
Set up `fzf-lua`, `neo-tree`, `gitsigns`, and `neogit`.

```lua
local M = {}

M.setup = function()
    -- fzf-lua
    require("fzf-lua").setup({
        fzf_colors = true,
    })

    -- neo-tree
    require("neo-tree").setup({
        filesystem = {
            hijack_netrw_behavior = "open_default",
        },
        window = {
            mappings = {
                ["<space>"] = {
                    "toggle_node",
                    nowait = true,
                },
            },
        },
    })

    -- gitsigns
    require("gitsigns").setup()

    -- neogit
    require("neogit").setup()
end

return M
```

- [ ] **Step 2: Update `nvim/init.lua` with Utils plugins**
Add plugins to `vim.pack.add` and require the Utils module.

```lua
-- Update vim.pack.add in nvim/init.lua
vim.pack.add({
    -- ... previous plugins ...
    gh("ibhagwan/fzf-lua"),
    gh("NeogitOrg/neogit"),
    gh("lewis6991/gitsigns.nvim"),
    gh("nvim-neo-tree/neo-tree.nvim"),
    gh("nvim-lua/plenary.nvim"),
    gh("MunifTanjim/nui.nvim"),
})

require("plugins.utils").setup()
```

- [ ] **Step 3: Verify Utils**
Run: `XDG_CONFIG_HOME=$(pwd) nvim`
Expected: `<leader>ff` opens fzf-lua, `<leader>df` opens Neo-tree.

- [ ] **Step 4: Commit Phase 3**
```bash
git add nvim/
git commit -m "feat(nvim): phase 3 utils (fzf-lua, neo-tree, neogit, gitsigns)"
```

---

### Task 4: Treesitter, LSP & Completion

**Files:**
- Create: `nvim/lua/plugins/treesitter.lua`
- Create: `nvim/lua/plugins/lsp.lua`
- Modify: `nvim/init.lua`

- [ ] **Step 1: Create `nvim/lua/plugins/treesitter.lua`**
Set up Treesitter. Note: `build = ":TSUpdate"` in lazy becomes a manual check or a hook in `vim.pack`.

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
Set up Mason, LSPConfig, Blink.cmp, and Conform.

```lua
local M = {}

M.setup = function()
    -- Mason
    require("mason").setup()
    require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls" },
        automatic_installation = true,
    })

    -- LSP Config
    local lspconfig = require("lspconfig")
    local capabilities = require('blink.cmp').get_lsp_capabilities()

    vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(event)
            local opts = { buffer = event.buf }
            vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
            vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
            vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, opts)
            vim.keymap.set({ "n", "x" }, "<F3>", function() require("conform").format({ async = true }) end, opts)
            vim.keymap.set("n", "<F4>", vim.lsp.buf.code_action, opts)
        end,
    })

    require("mason-lspconfig").setup_handlers({
        function(server_name)
            require("lspconfig")[server_name].setup({
                capabilities = capabilities,
            })
        end,
        ["lua_ls"] = function()
            lspconfig.lua_ls.setup({
                capabilities = capabilities,
                settings = {
                    Lua = {
                        diagnostics = { globals = { "vim" } },
                    },
                },
            })
        end,
    })

    -- Blink.cmp
    require("blink.cmp").setup({
        keymap = { preset = 'default' },
        sources = {
            default = { 'lsp', 'path', 'snippets', 'buffer' },
        },
    })

    -- Conform
    require("conform").setup({
        formatters_by_ft = {
            lua = { "stylua" },
        },
        format_on_save = { timeout_ms = 500 },
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
    gh("williamboman/mason.nvim"),
    gh("williamboman/mason-lspconfig.nvim"),
    gh("stevearc/conform.nvim"),
    { src = gh("saghen/blink.cmp"), version = "v0.*" },
})

require("plugins.treesitter").setup()
require("plugins.lsp").setup()
```

- [ ] **Step 4: Verify LSP & Treesitter**
Run: `XDG_CONFIG_HOME=$(pwd) nvim nvim/init.lua`
Expected: Syntax highlighting is active, `:LspInfo` shows `lua_ls` attached, autocompletion works.

- [ ] **Step 5: Commit Phase 4**
```bash
git add nvim/
git commit -m "feat(nvim): phase 4 treesitter, lsp, blink, conform"
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
