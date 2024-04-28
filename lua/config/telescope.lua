local utils = require "utils"

utils.map('n', '<C-g>', "<cmd>Telescope lsp_workspace_symbols<cr>")
utils.map('n', '<C-b>', "<cmd>lua require('telescope.builtin.lsp_document_symbols')<cr>")

local _builtin = require('telescope.builtin')
local T = {}

local file_ignore = {".git/", ".cache", "%.o", "%.a", "%.out", "%.class", "%.pdf", "%.zip", "node_modules/", "dist/"}

function T.grep_neovim()
    _builtin.live_grep {
        shorten_path = false,
        cwd = "~/.config/nvim",
        prompt = " - Dotfiles  - ",
        pickers = { hidden=true },
        file_ignore_patterns = file_ignore,
        height = 10,
    }
end

function T.grep_projects()
    _builtin.live_grep {
        shorten_path = false,
        cwd = "~/Projects",
        prompt = " - Grepping Projects - ",
        height = 10,
        pickers = { hidden=true },
        file_ignore_patterns = file_ignore,
    }
end

function T.open_neovim()
    _builtin.git_files {
        shorten_path = false,
        cwd = "~/.config/nvim",
        prompt = " - Dotfiles  - ",
        height = 10,
        pickers = { hidden=true },
        file_ignore_patterns = file_ignore,
    }
end

function T.open_projects()
    _builtin.find_files {
        shorten_path = false,
        cwd = "~/Projects",
        nrompt = " - Projects - ",
        height = 10,
        pickers = { hidden=true },
        file_ignore_patterns = file_ignore,
    }
end

-- basic keymapping
utils.map_fn('n', '<C-f>', function() _builtin.buffers({ layout_config = { preview_width = 0.6 } }) end)
utils.map_fn('n', '<leader>d', function() _builtin.help_tags({ layout_strategy='vertical' }) end)
utils.map_fn('n', '<leader>r', function() _builtin.registers() end)


utils.map_fn('n', '<C-p>', function()
  _builtin.find_files({ pickers = { hidden=true }, hidden=true, file_ignore_patterns=file_ignore })
end)

utils.map_fn('n', 'ff', function()
  _builtin.live_grep({ pickers = { hidden=true }, file_ignore_patterns=file_ignore, shorten_path= false })
end)

utils.map_fn('n', 'fn', function()
  _builtin.grep_string({ pickers = { hidden=true }, file_ignore_patterns=file_ignore, shorten_path= false })
end)

utils.map_fn('n', '<leader>gs', function()
  _builtin.git_status()
end)

utils.map_fn('n', '<leader>gc', function()
  _builtin.git_commit()
end)

utils.map_fn('n', '<leader>q', function()
  _builtin.git_status()
end)

-- mapping of custom functions

utils.map_fn('n', '<leader>ln', function() T.open_neovim() end)
utils.map_fn('n', '<leader>lh', function() T.open_projects() end)
utils.map_fn('n', '<leader>sn', function() T.grep_neovim() end)
utils.map_fn('n', '<leader>sh', function() T.grep_projects() end)

require('telescope').setup({
    defaults = {
        layout_config = {
          vertical = { width = 0.8 },
          horizontal = { width = 0.8, preview_width = 0.6 }
        }
    }
})


return T
