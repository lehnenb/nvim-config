local utils = require "utils"

utils.map('n', '<C-g>', "<cmd>Telescope lsp_workspace_symbols<cr>")
utils.map('n', '<C-b>', "<cmd>lua require('telescope.builtin.lsp_document_symbols')<cr>")


local T = {}
local file_ignore = {".git/", ".cache", "%.o", "%.a", "%.out", "%.class", "%.pdf", "%.zip", "node_modules/", "dist/"}

function T.grep_neovim()
    require('telescope.builtin').live_grep {
        shorten_path = false,
        cwd = "~/.config/nvim",
        prompt = " - Dotfiles  - ",
        file_ignore_patterns = file_ignore,
        height = 10,
        layout_stratey = 'horizontal',
        layout_options = {
            preview_width = 0.75,
        },
    }
end

function T.grep_projects()
    require('telescope.builtin').live_grep {
        shorten_path = false,
        cwd = "~/Projects",
        prompt = " - Projects - ",
        height = 10,
        file_ignore_patterns = file_ignore,
        layout_stratey = 'horizontal',
        layout_options = {
            preview_width = 0.75,
        },
    }
end

function T.open_neovim()
    require('telescope.builtin').git_files {
        shorten_path = false,
        cwd = "~/.config/nvim",
        prompt = " - Dotfiles  - ",
        height = 10,
        file_ignore_patterns = file_ignore,
        layout_stratey = 'horizontal',
        layout_options = {
            preview_width = 0.75,
        },
    }
end

function T.open_projects()
    require('telescope.builtin').find_files {
        shorten_path = false,
        cwd = "~/Projects",
        prompt = " - Projects - ",
        height = 10,
        file_ignore_patterns = file_ignore,
        layout_stratey = 'horizontal',
        layout_options = {
            preview_width = 0.75,
        },
    }
end


-- mapping of custom functions
utils.map('n', '<leader>ln', "<cmd>lua require('config.telescope').open_neovim()<cr>")
utils.map('n', '<leader>lh', "<cmd>lua require('config.telescope').open_projects()<cr>")
utils.map('n', '<leader>gs', "<cmd>Telescope git_status<cr>")
utils.map('n', '<leader>lo', "<cmd>Telescope oldfiles<cr>")

utils.map('n', '<leader>sn', "<cmd>lua require('config.telescope').grep_neovim()<cr>")
utils.map('n', '<leader>sh', "<cmd>lua require('config.telescope').grep_projects()<cr>")


return T
