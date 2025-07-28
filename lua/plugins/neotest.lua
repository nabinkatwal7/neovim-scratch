require("neotest").setup({
  adapters = {
    require("neotest-jest")({
      jestCommand = "npm test --",
      jestConfigFile = "jest.config.js",
      env = { CI = true },
      cwd = function()
        return vim.fn.getcwd()
      end,
    }),
    require("neotest-vitest")({
      filter_dir = function(name, rel_path, root)
        return name ~= "node_modules"
      end,
    }),
    require("neotest-go"),
  },
})

