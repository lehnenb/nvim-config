local function set_lsp_keymaps(lsp_client, bufnr)
    local function buf_set_keymap(mode, key, cmd, desc)
        vim.api.nvim_buf_set_keymap(bufnr, mode, key, cmd, { noremap = true, silent = true, desc = desc })
    end

    buf_set_keymap('n', '<leader>gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', 'LSP: go to declaration')
    buf_set_keymap('n', '<leader>gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', 'LSP: go to definition')
    buf_set_keymap('n', '<leader>gv', '<Cmd>vsplit<CR><Cmd>lua vim.lsp.buf.definition()<CR>', 'LSP: go to definition in vsplit')
    buf_set_keymap('n', '<leader>gh', '<Cmd>vsplit<CR><Cmd>lua vim.lsp.buf.definition()<CR>', 'LSP: go to definition in split')

    buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', 'LSP: hover docs')
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', 'LSP: go to implementation')
    buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', 'LSP: signature help')
    buf_set_keymap('n', '<leader>lt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', 'LSP: type definition')
    buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', 'LSP: rename symbol')
    buf_set_keymap('n', '<leader>lrf', '<cmd>lua vim.lsp.buf.references()<CR>', 'LSP: references')
    buf_set_keymap('n', '<leader>ld', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', 'LSP: line diagnostics')
    buf_set_keymap('n', '<leader>ll', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', 'LSP: diagnostics to loclist')
    buf_set_keymap('n', '<leader>lca', '<cmd>lua vim.lsp.buf.code_action()<CR>', 'LSP: code action')

    vim.keymap.set('n', '[d', function()
      vim.diagnostic.jump({ count = -1, float = { border = 'rounded' } })
    end, { buffer = true, silent = true, desc = 'LSP: previous diagnostic' })

    vim.keymap.set('n', 'd]', function()
      vim.diagnostic.jump({ count = 1, float = { border = 'rounded' } })
    end, { buffer = true, silent = true, desc = 'LSP: next diagnostic' })

    if lsp_client.server_capabilities.document_formatting then
        buf_set_keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format()<CR>", 'LSP: format buffer')
    end
end

-- Attach key mappings
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
      local lsp_client = assert(vim.lsp.get_client_by_id(args.data.client_id))

      require'lsp_signature'.on_attach()

      if lsp_client:supports_method('textDocument/documentHighlight') then
        vim.api.nvim_create_autocmd({ 'CursorHold' }, {
          group = vim.api.nvim_create_augroup('mw_lsp_highlight_hold', { clear = false }),
          buffer = args.buf,
          callback = function()
            vim.lsp.buf.document_highlight()
          end
        })

        vim.api.nvim_create_autocmd({ 'CursorMoved' }, {
          group = vim.api.nvim_create_augroup('mw_lsp_highlight_moved', { clear = false }),
          buffer = args.buf,
          callback = function()
            vim.lsp.buf.clear_references()
          end
        })
      end

      set_lsp_keymaps(lsp_client, args.buf)
    end
})

if vim.fn.executable('tsp-server') == 1 then
  vim.lsp.enable('tsp-server')
end

if vim.fn.executable('lua-language-server') == 1 then
  vim.lsp.enable('luals')
end

if vim.fn.executable('gopls') == 1 then
  vim.lsp.enable('gopls')
end

if vim.fn.executable('ruby-lsp') == 1 then
  vim.lsp.enable('ruby-lsp')
end

if vim.fn.executable('rubocop') == 1 then
  vim.lsp.enable('rubocop')
end
