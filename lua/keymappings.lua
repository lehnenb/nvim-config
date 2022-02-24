local utils = require('utils')
utils.map('n', '<C-x>', '<cmd>noh<CR>') -- Clear highlights
utils.map('i', 'jk', '<Esc>')           -- jk to escape
utils.map('n', '<C-a>', '<cmd>bprev<CR>')
utils.map('n', '<C-d>', '<cmd>bnext<CR>')
-- utils.map('n', '<c-k>',  '<cmd>wincmd k<CR>')
-- utils.map('n', '<c-j>', '<cmd>wincmd j<CR>')
-- utils.map('n', "<c-h>", '<cmd>wincmd h<CR>')
-- utils.map('n', "<c-l>", '<cmd>wincmd l<CR>')
