local utils = require "utils"

utils.map('n', '<C-g>', "<cmd>Telescope lsp_workspace_symbols<cr>")
utils.map('n', '<C-b>', "<cmd>lua require('telescope.builtin.lsp_document_symbols')<cr>")


local T = {}

function T.edit_neovim()
    require('telescope.builtin').git_files {
        shorten_path = false,
        cwd = "~/.config/nvim",
        prompt = " - Dotfiles  - ",
        height = 10,
        layout_stratey = 'horizontal',
        layout_options = {
            preview_width = 0.75,
        },
    }
end

-- mapping of custom functions
utils.map('n', '<leader>n', "<cmd>lua require('config.telescope').edit_neovim()<cr>")

return T
