local utils = require "utils"

utils.map('n', '<C-g>', "<cmd>Telescope lsp_workspace_symbols<cr>")
utils.map('n', '<C-b>', "<cmd>lua require('telescope.builtin.lsp_document_symbols')<cr>")

local _builtin = require('telescope.builtin')
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

-- basic keymapping
utils.map_fn('n', '<C-f>', function() _builtin.buffers() end)
utils.map_fn('n', '<leader>fh', function() _builtin.help_tags() end)


utils.map_fn('n', '<C-p>', function()
  _builtin.find_files({ hidden=true, file_ignore_patterns=file_ignore })
end)

utils.map_fn('n', 'ff', function()
  _builtin.live_grep({ hidden=true, file_ignore_patterns=file_ignore, shorten_path= false })
end)

utils.map_fn('n', 'fc', function()
  _builtin.grep_string({ hidden=true, file_ignore_patterns=file_ignore, shorten_path= false })
end)


-- mapping of custom functions

utils.map_fn('n', '<leader>ln', function() T.open_neovim() end)
utils.map_fn('n', '<leader>lh', function() T.open_projects() end)
utils.map_fn('n', '<leader>gs', function() T.git_status() end)
utils.map_fn('n', '<leader>lo', function() T.oldfiles() end)
utils.map_fn('n', '<leader>sn', function() T.grep_neovim() end)
utils.map_fn('n', '<leader>sh', function() T.grep_projects() end)


return T
