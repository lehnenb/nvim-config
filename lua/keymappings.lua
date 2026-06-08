local utils = require('utils')
utils.map('n', '<C-x>', '<cmd>noh<CR>', { desc = 'Clear search highlights' })
utils.map('i', 'jk', '<Esc>', { desc = 'Escape insert mode' })
utils.map('n', '<C-a>', '<cmd>bprev<CR>', { desc = 'Previous buffer' })
utils.map('n', '<C-d>', '<cmd>bnext<CR>', { desc = 'Next buffer' })
utils.map('n', '<leader>s', '<cmd>cprev<CR>', { desc = 'Previous quickfix item' })
utils.map('n', '<leader>f', '<cmd>cnext<CR>', { desc = 'Next quickfix item' })
utils.map('n', '<leader>rs', '<cmd>luafile %<cr>', { desc = 'Reload current lua file' })


-- Set list
utils.map_fn('n', '<leader>c', function() vim.o.list = not vim.o.list end, { desc = 'Toggle list chars' })

-- Splits

utils.map('n', '<leader>r', '<cmd>SmartResizeMode<CR>', { desc = 'Smart resize mode' })
utils.map('n', '<C-k>', '<cmd>SmartCursorMoveUp<CR>', { desc = 'Smart move up' })
utils.map('n', '<C-j>', '<cmd>SmartCursorMoveDown<CR>', { desc = 'Smart move down' })
utils.map('n', '<C-l>', '<cmd>SmartCursorMoveRight<CR>', { desc = 'Smart move right' })
utils.map('n', '<C-h>', '<cmd>SmartCursorMoveLeft<CR>', { desc = 'Smart move left' })
