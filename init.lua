-- Map leader to space
vim.g.mapleader = ','

fn = vim.fn
local execute = vim.api.nvim_command

-- Sensible defaults
   require('settings')

-- Key mappings
   require('keymappings')

-- Lua LSP
  require('lsp_lua')

-- Loads config files
  require('config.colorscheme')
  require('config.completion')
  require('config.fugitive')


require 'paq-nvim' {
  'savq/paq-nvim';                  -- Let Paq manage itself

  -- Color scheme
  'rakr/vim-one';

  -- Fuzzy file finder
  'nvim-lua/plenary.nvim';
  'nvim-lua/popup.nvim';
  'nvim-telescope/telescope.nvim';

  -- File explorer
  'preservim/nerdtree'; 

  -- Enclosing characters utility
  'tpope/vim-surround';

  -- LSP and completion
  'neovim/nvim-lspconfig';
  'nvim-lua/completion-nvim';

  -- Lua development
  'tjdevries/nlua.nvim';


  -- Vim dispatch
  'tpope/vim-dispatch';

  -- Fugitive for Git
  'tpope/vim-fugitive';
}
