require("nvim-treesitter.configs").setup({
  ensure_installed = { "lua", "typescript", "javascript", "html", "css", "bash", "json" },
  highlight = { enable = true },
  indent = { enable = true },
})

