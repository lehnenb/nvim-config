local function set_lsp_keymaps(lsp_client, bufnr)
    local function buf_set_keymap(mode, key, cmd)
        local opts = {noremap = true, silent = true}
        vim.api.nvim_buf_set_keymap(bufnr, mode, key, cmd, opts)
    end

    -- Mappings.
    buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>')
    buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>')
    buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>')
    buf_set_keymap('n', 'gi', '<cmd>ua vim.lsp.buf.implementation()<CR>')
    buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
    buf_set_keymap('n', '<leader>lt', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
    buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
    buf_set_keymap('n', '<leader>lrf', '<cmd>lua vim.lsp.buf.references()<CR>')
    buf_set_keymap('n', '<leader>ld', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>')
    buf_set_keymap('n', '<leader>ll','<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>')
    buf_set_keymap('n', '<leader>lca', '<cmd>lua vim.lsp.buf.code_action()<CR>')

    vim.keymap.set('n', '[d', function()
      vim.diagnostic.jump({ count = -1, float = { border = 'rounded' } })
    end, { buffer = true, silent = true })

    vim.keymap.set('n', 'd]', function()
      vim.diagnostic.jump({ count = 1, float = { border = 'rounded' } })
    end, { buffer = true, silent = true })

    -- Set some keybinds conditional on server capabilities
    if lsp_client.server_capabilities.document_formatting then
        buf_set_keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format()<CR>")
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


if vim.fn.executable('lua-language-server') == 1 then
  vim.lsp.enable('luals')
end

if vim.fn.executable('gopls') == 1 then
  vim.lsp.enable('gopls')
end
