local nvim_lsp = require("lspconfig")
local L = {}

function L.setup_lsp(capabilities, on_attach)
  nvim_lsp.lua_ls.setup({
      settings = {
        Lua = {
          runtime = {
            -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
            version = 'LuaJIT',
          },
          diagnostics = {
              globals = { 'vim' }
          },
          workspace = {
            -- Make the server aware of Neovim runtime files
            library = vim.api.nvim_get_runtime_file("", true),
          }
        }
    }
  })
end

return L
