-- Map leader to space
vim.g.mapleader = ','

fn = vim.fn
local execute = vim.api.nvim_command

-- Sensible defaults
   require('settings')

-- Key mappings
   require('keymappings')


--- Lua LSP
  require('lsp_lua')

-- LSP
  require('lang')

-- Loads config files
  require('config.colorscheme')
  require('config.fugitive')
  require('config.compe')
  require('config.lspkind')

require 'paq-nvim' {
  -- Dashboard for nvim
  'glepnir/dashboard-nvim';

  -- Let Paq manage itself
  'savq/paq-nvim';                  

  -- Color scheme
  'rakr/vim-one';

  -- Code formatting
  'sbdchd/neoformat';

  -- Pictograms
  'onsails/lspkind-nvim';

  -- Snippets
  'cstrap/python-snippets';
  'ylcnfrht/vscode-python-snippet-pack';
  'xabikos/vscode-javascript';
  'golang/vscode-go';
  'rust-lang/vscode-rust';

  -- Fuzzy file finder
  'nvim-lua/plenary.nvim';
  'nvim-lua/popup.nvim';
  'nvim-telescope/telescope.nvim';

  -- File explorer
  'preservim/nerdtree'; 

  -- Enclosing characters utility
  'tpope/vim-surround';


  -- Diagnostics
  'kyazdani42/nvim-web-devicons';
  'folke/trouble.nvim';

  -- LSP and completion
  'ray-x/lsp_signature.nvim';
  'neovim/nvim-lspconfig';
  'hrsh7th/nvim-compe';
  'glepnir/lspsaga.nvim';


  -- Lua development
  'folke/lua-dev.nvim';
  'tjdevries/nlua.nvim';

  -- Vim dispatch
  'tpope/vim-dispatch';

  -- Fugitive for Git
  'tpope/vim-fugitive';
}

require("trouble").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
