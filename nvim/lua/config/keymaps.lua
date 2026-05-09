local map = vim.keymap.set
local M = {}

M.setup = function()
	local snacks = require("snacks")

	-- Navigation (via Snacks)
	map("n", "<leader><space>", function() snacks.picker.smart() end, { desc = "Smart Find Files" })
	map("n", "<leader>e", function() snacks.explorer() end, { desc = "File Explorer" })
	map("n", "<leader>ff", function() snacks.picker.files() end, { desc = "Find Files" })
	map("n", "<leader>fg", function() snacks.picker.grep() end, { desc = "Live Grep" })
	map("n", "<leader>fb", function() snacks.picker.buffers() end, { desc = "Find Buffers" })
	map("n", "<leader>fh", function() snacks.picker.help() end, { desc = "Help Tags" })
	map("n", "<leader>fk", function() snacks.picker.keymaps() end, { desc = "Keymaps" })
	map("n", "<leader>fd", function() snacks.picker.diagnostics() end, { desc = "Diagnostics" })
end

return M
