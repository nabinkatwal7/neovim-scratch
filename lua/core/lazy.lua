local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { "nvim-lua/plenary.nvim" },
  { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  { "williamboman/mason.nvim",
    build = ":MasonUpdate",
    dependencies= {
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "tsserver",
          "jsonls",
          "html",
          "cssls",
        },
      })
    end,
  },
  { "neovim/nvim-lspconfig" },
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "L3MON4D3/LuaSnip" },
  { "nvim-lualine/lualine.nvim" },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  {"nvim-lualine/lualine.nvim"},
  {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "theHamsta/nvim-dap-virtual-text",
    "jay-babu/mason-nvim-dap.nvim",
    }
  },
  {
  "marilari88/neotest-vitest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-neotest/neotest-jest",
    "nvim-neotest/neotest-go",
    "nvim-neotest/neotest-vitest",
    }
  },
  { "L3MON4D3/LuaSnip", dependencies = { "rafamadriz/friendly-snippets" } },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/cmp-buffer" },
  { "saadparwaiz1/cmp_luasnip" },
}, {})

require("lualine").setup()

