
local utils = require('utils')

local cmd = vim.cmd

cmd 'syntax enable'

utils.opt('o', 'hidden', true)
utils.opt('o', 'ignorecase', true)
utils.opt('o', 'shiftround', true)
utils.opt('o', 'smartcase', true)
utils.opt('o', 'splitbelow', true)
utils.opt('o', 'splitright', true)
utils.opt('o', 'wildmode', 'list:longest')
utils.opt('w', 'number', true)
utils.opt('w', 'relativenumber', true)
utils.opt('o', 'clipboard','unnamed,unnamedplus')


 -- Hightlight curent line
vim.cmd([[
  set cursorline
  hi cursorline cterm=none term=none
  autocmd WinEnter * setlocal cursorline
  autocmd WinLeave * setlocal nocursorline
  highlight CursorLine guibg=#181818 ctermbg=234
]])


-- Indentation
local indentation = {
  lua = 2,
  javascript = 2,
  typescript=2,
  javascriptreact = 2,
  typescriptreact = 2,
  ruby=2,
  java=4,
  go = 4
}

cmd [[
  set filetype
  filetype indent on
  filetype on 
]]

for lang, level in pairs(indentation)  do
  vim.cmd(string.format('autocmd FileType %s setlocal expandtab shiftwidth=%d tabstop=%d', lang, level, level))
end

-- Highlight on yank
vim.cmd 'au TextYankPost * lua vim.highlight.on_yank {on_visual = false}'
