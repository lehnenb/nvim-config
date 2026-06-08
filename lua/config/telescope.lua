local utils = require "utils"

utils.map('n', '<C-g>', "<cmd>Telescope lsp_workspace_symbols<cr>")
utils.map('n', '<C-b>', "<cmd>lua require('telescope.builtin.lsp_document_symbols')<cr>")

local _builtin = require('telescope.builtin')
local T = {}

local file_ignore = {".git/", ".cache", "%.o", "%.a", "%.out", "%.class", "%.pdf", "%.zip", "node_modules/", "dist/"}
local file__without_test_ignore = {".git/", ".cache", "%.o", "%.a", "%.out", "%.class", "%.pdf", "%.zip", "node_modules/", "dist/", "jest", "spec/", "tests/", "__tests__/", "vendor/", "%.test%.", "_test%.", "%.spec%.", "%.e2e", "%.mock" }
local rg_args = { "--follow" }

function T.grep_neovim()
    _builtin.live_grep {
        shorten_path = false,
        cwd = "~/.config/nvim",
        prompt = " - Dotfiles  - ",
        pickers = { hidden=true },
        file_ignore_patterns = file_ignore,
        additional_args = rg_args,
        height = 10,
    }
end

function T.grep_projects()
    _builtin.live_grep {
        shorten_path = false,
        cwd = "~/Perspective/projects",
        prompt = " - Grepping Projects - ",
        height = 10,
        additional_args = rg_args,
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
        follow = true,
        pickers = { hidden=true },
        file_ignore_patterns = file_ignore,
    }
end

function T.open_projects()
    _builtin.find_files {
        shorten_path = false,
        cwd = "~/Projects",
        nrompt = " - Projects - ",
        follow = true,
        height = 10,
        pickers = { hidden=true },
        file_ignore_patterns = file_ignore,
    }
end

-- basic keymapping
utils.map_fn('n', '<C-f>', function() _builtin.buffers({ layout_config = { preview_width = 0.6 } }) end, { desc = 'Telescope: buffers' })
utils.map_fn('n', '<leader>d', function() _builtin.help_tags({ layout_strategy='vertical' }) end, { desc = 'Telescope: help tags' })
utils.map_fn('n', '<leader>r', function() _builtin.registers() end, { desc = 'Telescope: registers' })

utils.map_fn('n', '<C-p>', function()
  _builtin.find_files({ pickers = { hidden=true }, hidden=true, follow = true, file_ignore_patterns=file_ignore })
end, { desc = 'Telescope: find files' })

utils.map_fn('n', '<C-t>', function()
  _builtin.find_files({ pickers = { hidden=true }, hidden=true, follow = true, file_ignore_patterns=file__without_test_ignore })
end, { desc = 'Telescope: find files (no tests)' })

utils.map_fn('n', 'ff', function()
  _builtin.live_grep({ pickers = { hidden=true }, additional_args = rg_args, file_ignore_patterns=file_ignore, shorten_path= false })
end, { desc = 'Telescope: live grep' })

utils.map_fn('n', 'ft', function()
  _builtin.live_grep({ pickers = { hidden=true }, additional_args = rg_args, file_ignore_patterns=file__without_test_ignore, shorten_path= false })
end, { desc = 'Telescope: live grep (no tests)' })

utils.map_fn('n', 'fn', function()
  _builtin.grep_string({ pickers = { hidden=true }, additional_args = rg_args, file_ignore_patterns=file_ignore, shorten_path= false })
end, { desc = 'Telescope: grep string under cursor' })

utils.map_fn('v', 'fn', function()
  vim.cmd('noau normal! "vy"')
  local selection = vim.fn.getreg('v')
  vim.fn.setreg('v', {})
  _builtin.grep_string({ search = selection, pickers = { hidden=true }, additional_args = rg_args, file_ignore_patterns=file_ignore, shorten_path= false })
end, { desc = 'Telescope: grep visual selection' })

utils.map_fn('n', '<leader>gs', function() _builtin.git_status() end, { desc = 'Telescope: git status' })
utils.map_fn('n', '<leader>gc', function() _builtin.git_commit() end, { desc = 'Telescope: git commits' })
utils.map_fn('n', '<leader>q', function() _builtin.git_status() end, { desc = 'Telescope: git status' })

-- mapping of custom functions

utils.map_fn('n', '<leader>mk', function()
  local pickers = require('telescope.pickers')
  local finders = require('telescope.finders')
  local conf = require('telescope.config').values
  pickers.new({}, {
    prompt_title = 'Custom Keymaps',
    finder = finders.new_table({
      results = utils.get_custom_keymaps(),
      entry_maker = function(entry)
        local display = string.format('%-12s %-20s %s', '[' .. entry.mode .. ']', entry.lhs, entry.desc)
        return { value = entry, display = display, ordinal = entry.lhs .. ' ' .. entry.desc }
      end,
    }),
    sorter = conf.generic_sorter({}),
  }):find()
end, { desc = 'Custom keymaps' })
utils.map_fn('n', '<leader>ln', function() T.open_neovim() end, { desc = 'Telescope: open neovim files' })
utils.map_fn('n', '<leader>lh', function() T.open_projects() end, { desc = 'Telescope: open projects' })
utils.map_fn('n', '<leader>sn', function() T.grep_neovim() end, { desc = 'Telescope: grep neovim config' })
utils.map_fn('n', '<leader>sh', function() T.grep_projects() end, { desc = 'Telescope: grep projects' })

require('telescope').setup({
    defaults = {
        layout_config = {
          vertical = { width = 0.8 },
          horizontal = { width = 0.8, preview_width = 0.6 }
        }
    }
})


return T
