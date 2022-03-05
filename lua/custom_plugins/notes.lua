function NewNote()
    local timestamp = os.date("%d%m%y%H%M%S")
    local filepath = string.format("~/notes/%s.md", timestamp)
    vim.cmd("vnew "..filepath)
end


local utils = require('utils')

utils.map('n', '<leader>tn', '<cmd>lua NewNote()<CR>')
