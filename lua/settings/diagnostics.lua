-- LSP Enable diagnostics

local capabilities = require('cmp_nvim_lsp').default_capabilities()
local signs = {
  Error = '!',
  Warn = '?',
  Info = 'i',
  Hint = 'h',
}

vim.lsp.config('*', {
  capabilities = capabilities,
})

vim.diagnostic.config({
  virtual_text = true,
  underline = true,
  update_in_insert = true,
  float = {
    header = 'Diagnostics',
    prefix = function(diagnostic, _, _)
      if diagnostic.severity == vim.diagnostic.severity.ERROR then
        return (signs.Error .. ' '), ''
      elseif diagnostic.severity == vim.diagnostic.severity.HINT then
        return (signs.Hint .. ' '), ''
      elseif diagnostic.severity == vim.diagnostic.severity.INFO then
        return (signs.Info .. ' '), ''
      elseif diagnostic.severity == vim.diagnostic.severity.WARN then
        return (signs.Warn .. ' '), ''
      else
        return ('? '), ''
      end
    end,
  },
  severity_sort = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = signs.Error,
      [vim.diagnostic.severity.HINT] = signs.Hint,
      [vim.diagnostic.severity.INFO] = signs.Info,
      [vim.diagnostic.severity.WARN] = signs.Warn,
    },
  },
})

-- Override signs used elsewhere e.g. Trouble.nvim
local sign_types = {
  Error = signs.Error,
  Warn = signs.Warn,
  Hint = signs.Hint,
  Info = signs.Info
}
for type, icon in pairs(sign_types) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, {
    text = icon,
    texthl = hl,
    numhl = ""
  })
end
