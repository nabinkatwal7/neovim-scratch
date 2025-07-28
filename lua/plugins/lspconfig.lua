local lspconfig = require("lspconfig")

local capabilities = require("cmp_nvim_lsp").default_capabilities()

local servers = {
  lua_ls = {},
  tsserver = {},
  html = {},
  cssls = {},
  jsonls = {},
}

for name, opts in pairs(servers) do
  lspconfig[name].setup({
    capabilities = capabilities,
    settings = opts,
    on_attach = function(client, bufnr)
      if client.server_capabilities.documentFormattingProvider then
        vim.api.nvim_create_autocmd("BufWritePre", {
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.format({ async = false })
          end,
        })
      end
    end
  })
end

