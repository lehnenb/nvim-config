-- Map leader to space
vim.g.mapleader = ','

-- Sensible defaults
   require('settings')

-- Key mappings
   require('keymappings')

-- LSP
  require('lsp')

-- Loads config files
  require('config.colorscheme')
  require('config.fugitive')
  require('config.cmp')
  require('config.nvim-web-devicons')
  require('config.feline')
  require('config.nvim-tree')
  require('config.lspkind')
  require('config.vim-snip')
  require('config.trouble')
  require('config.telescope')
  require('config.null-ls')

-- Custom plugins
  require('custom_plugins.notes')

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]


require('packer').startup(function(use)
  -- Terminal
  use 'vimlab/split-term.vim'

  -- Dashboard for nvim
  use 'glepnir/dashboard-nvim'

  -- Let Packer manage itself
  use 'wbthomason/packer.nvim'

  -- Color scheme
  use 'rakr/vim-one'

  -- Code formatting
  use  'sbdchd/neoformat'

  -- Pictograms
  use 'onsails/lspkind-nvim'

  -- Fuzzy file finder
  use 'nvim-lua/popup.nvim'
  use 'nvim-telescope/telescope.nvim'

  -- File explorer
  use 'kyazdani42/nvim-tree.lua'

  -- Enclosing characters utility
  use 'tpope/vim-surround'

  -- Diagnostics
  use 'kyazdani42/nvim-web-devicons'
  use 'folke/trouble.nvim'

  -- LSP and completion
  use 'ray-x/lsp_signature.nvim'
  use 'golang/vscode-go'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/vim-vsnip-integ'
  use 'glepnir/lspsaga.nvim'
  use "jose-elias-alvarez/null-ls.nvim"
  -- "jose-elias-alvarez/nvim-lsp-ts-utils";

  -- Tmux navigation
  use "christoomey/vim-tmux-navigator";

  -- Icons
  use 'ryanoasis/vim-devicons'

  -- Lua development
  use 'nvim-lua/plenary.nvim'
  use 'folke/lua-dev.nvim'
  use 'tjdevries/nlua.nvim'

  -- Vim dispatch
  use 'tpope/vim-dispatch'

  -- Fugitive for Git
  use 'tpope/vim-fugitive'

  -- Status bar
  use 'feline-nvim/feline.nvim'

  -- Error colors
  use 'folke/lsp-colors.nvim'

  -- Lint integration
  use 'mfussenegger/nvim-lint'
end)
