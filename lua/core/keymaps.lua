local keymap = vim.keymap.set


vim.g.mapleader = " "

keymap("n", "<leader>pv", vim.cmd.Ex)
keymap("n", "<leader>ff", "<cmd>Telescope find_files<CR>")
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<CR>")
keymap("n", "<leader>fb", "<cmd>Telescope buffers<CR>")
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<CR>")

vim.keymap.set("n", "<leader>tt", function() require("neotest").run.run() end, { desc = "Run nearest test" })
vim.keymap.set("n", "<leader>tf", function() require("neotest").run.run(vim.fn.expand("%")) end, { desc = "Run test file" })
vim.keymap.set("n", "<leader>ts", function() require("neotest").summary.toggle() end, { desc = "Toggle test summary" })

vim.keymap.set({ "n", "i", "v" }, "<C-s>", "<cmd>w<CR>", { desc = "Save file" })

-- Toggle Neo-tree
vim.keymap.set("n", "<leader>ee", ":Neotree toggle<CR>", { noremap = true, silent = true })

-- Close current buffer
vim.keymap.set("n", "<C-q>", ":bd<CR>", { noremap = true, silent = true })

