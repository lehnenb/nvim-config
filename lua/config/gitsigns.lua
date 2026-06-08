local utils = require('utils')

local gitsigns = require('gitsigns')

local blame_line = function()
  gitsigns.blame_line({ full = true })
end

local blame = function()
  gitsigns.blame({ full = true })
end

local next_hunk = function()
  if vim.wo.diff then
    vim.cmd.normal({']c', bang = true})
  else
    gitsigns.nav_hunk('next')
  end
end

local previous_hunk = function()
  if vim.wo.diff then
    vim.cmd.normal({'[c', bang = true})
  else
    gitsigns.nav_hunk('prev')
  end
end


gitsigns.setup{
  signs = {
    add          = { text = '┃' },
    change       = { text = '┃' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
    untracked    = { text = '┆' },
  },
  signs_staged = {
    add          = { text = '┃' },
    change       = { text = '┃' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
    untracked    = { text = '┆' },
  },
  signs_staged_enable = true,
  signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
  numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff  = true, -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir = {
    follow_files = true
  },
  auto_attach = true,
  attach_to_untracked = false,
  current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
    virt_text_priority = 100,
    use_focus = true,
  },
  current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
  blame_formatter = nil, -- Use default
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  max_file_length = 40000, -- Disable if file is longer than this (in lines)
  preview_config = {
    -- Options passed to nvim_open_win
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1
  },
  on_attach = function(bufnr)
    utils.map_fn('n', '<leader>gl', blame_line, { desc = 'Git blames a single line' })
    utils.map_fn('n', '<leader>gb', blame, { desc = 'Opens git blame split' })
    utils.map_fn('n', '<leader>gd', gitsigns.preview_hunk, { desc = 'Previews diff hunk in pop-up' })
    utils.map_fn('n', '<leader>gi', gitsigns.preview_hunk_inline, { desc = 'Preview diff hunk inline' })

    -- Navigation
    utils.map_fn('n', ']c', next_hunk, { desc = 'Go to next chunk'})
    utils.map_fn('n', '[c', previous_hunk, { desc = 'Go to previous chunk'})
  end
}
