require("nvim-treesitter.configs").setup({
  ensure_installed = { "lua", "typescript", "javascript", "html", "css", "bash", "json", "tsx" },
  highlight = { enable = true },
  indent = { enable = true },
  autotag = {enable=true},
})


