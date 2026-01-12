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

vim.cmd [[
  set filetype
  filetype indent on
  filetype on 
]]

for lang, level in pairs(indentation)  do
  local indentCmd = string.format('autocmd FileType %s setlocal', lang)

  if lang ~= 'go' then
    indentCmd = indentCmd .. string.format(' expandtab shiftwidth=%d tabstop=%d', level, level)
  end

  vim.cmd(indentCmd)
end

-- Highlight on yank
vim.cmd 'au TextYankPost * lua vim.highlight.on_yank {on_visual = false}'
vim.cmd 'set listchars=eol:$,space:-,tab:>#,trail:~'
vim.cmd 'set nolist'
