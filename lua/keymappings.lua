local utils = require('utils')
utils.map('n', '<C-x>', '<cmd>noh<CR>') -- Clear highlights
utils.map('i', 'jk', '<Esc>')           -- jk to escape
utils.map('n', '<C-a>', '<cmd>bprev<CR>')
utils.map('n', '<C-d>', '<cmd>bnext<CR>')
