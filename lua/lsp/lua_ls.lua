local nvim_lsp = require("lspconfig")

nvim_lsp.lua_ls.setup({
    settings = {
          diagnostics = {
              globals = { 'vim' }
          }
  }
})


