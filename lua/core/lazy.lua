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
  -- codeium config
  { "Exafunction/windsurf.nvim",
     dependencies = {
        "nvim-lua/plenary.nvim",
        "hrsh7th/nvim-cmp",
      },
      config = function()
        require("codeium").setup({
      })
    end,
    event = "InsertEnter"
  },
  -- File explorer
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
  },
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
          "jsonls",
          "html",
          "cssls",
          "vtsls",
          "eslint",
          "gopls",
        },
      })
    end,
  },
  { "neovim/nvim-lspconfig" },
  {"folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "jose-elias-alvarez/typescript.nvim" },
  { "ray-x/go.nvim", dependencies = { "ray-x/guihua.lua" }, config = true, ft = { "go", "gomod" } },
  { "dmmulroy/tsc.nvim" },
  { "jose-elias-alvarez/null-ls.nvim" },
  { "rafamadriz/friendly-snippets" },
  {"nvim-tree/nvim-web-devicons"},
  { "L3MON4D3/LuaSnip" },
  { "nvim-lualine/lualine.nvim" },
  -- Autopairs for (), {}, "", etc.
  {"windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup({})

      -- CMP integration (confirm suggestion also inserts closing )
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      local cmp = require("cmp")
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
  },
  -- Autotag for </> in HTML/JSX
  {
    "windwp/nvim-ts-autotag",
    ft = { "html", "javascript", "typescript", "javascriptreact", "typescriptreact", "svelte", "vue", "astro" },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
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

