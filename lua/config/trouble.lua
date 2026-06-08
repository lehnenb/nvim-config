local utils = require('utils')

utils.map('n', '<leader>td', '<cmd>Trouble diagnostics toggle<cr>', { silent = true, desc = 'Trouble: diagnostics' })
utils.map('n', '<leader>tl', '<cmd>Trouble lsp toggle focus=false win.position=right<cr>', { silent = true, desc = 'Trouble: LSP' })

require("trouble").setup {
    auto_preview = true,
}
