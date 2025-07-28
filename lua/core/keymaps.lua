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

vim.keymap.set("n", "<leader>gg", "<cmd>LazyGit<CR>", { desc = "LazyGit UI" })
vim.keymap.set("n", "<leader>gs", "<cmd>Git<CR>", { desc = "Fugitive Git status" })
vim.keymap.set("n", "<leader>gb", "<cmd>G blame<CR>", { desc = "Git blame" })
vim.keymap.set("n", "<leader>gd", "<cmd>Gvdiffsplit<CR>", { desc = "Git diff split" })

vim.keymap.set("n", "]h", require("gitsigns").next_hunk, { desc = "Next Git Hunk" })
vim.keymap.set("n", "[h", require("gitsigns").prev_hunk, { desc = "Prev Git Hunk" })
vim.keymap.set("n", "<leader>hr", require("gitsigns").reset_hunk, { desc = "Reset Hunk" })
vim.keymap.set("n", "<leader>hp", require("gitsigns").preview_hunk, { desc = "Preview Hunk" })

