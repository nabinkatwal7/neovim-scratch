local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.prettier.with({
      prefer_local = "node_modules/.bin", -- use project’s prettier
      filetypes = { "javascript", "typescript", "typescriptreact", "json", "yaml", "html", "css", "scss", "markdown" },
    }),
  },
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      local format_group = vim.api.nvim_create_augroup("Format", { clear = true })
      vim.api.nvim_create_autocmd({ "BufWritePre", "TextYankPost" }, {
        group = format_group,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ async = false })
        end,
      })
    end
  end,
})

