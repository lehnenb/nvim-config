local utils = require('utils')
utils.map('n', '<C-x>', '<cmd>noh<CR>') -- Clear highlights
utils.map('i', 'jk', '<Esc>')           -- jk to escape
utils.map('n', '<C-a>', '<cmd>bprev<CR>')
utils.map('n', '<C-d>', '<cmd>bnext<CR>')
utils.map('n', '<leader>rs', '<cmd>luafile %<cr>')

-- debugger

utils.map('n', '<leader>ds', '<cmd>lua require("dap").continue()<CR>')
utils.map('n', '<leader>do', '<cmd>lua require("dapui").open()<CR>')
utils.map('n', '<leader>dc', '<cmd>lua require("dapui").close()<CR>')
utils.map('n', '<leader>dbp', '<cmd>lua require("dap").set_breakpoint()<CR>')
utils.map('n', '<leader>dsi', '<cmd>lua require("dap").step_into()<CR>')

