local map = vim.keymap.set
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

