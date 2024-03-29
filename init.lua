-- Map leader to space
vim.g.mapleader = ','

-- Sensible defaults
   require('settings')

-- Key mappings
   require('keymappings')

-- Mason and lsp
  require('config.mason')
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
  require('config.treesitter')
  require('config.nvim-autopairs')
  require('config.yaml')
  require('config.dap')
  require('config.neodev')

-- Indent
  require('config.indent-blankline')

-- Custom plugins
  require('custom_plugins.notes')

  -- Playground
  vim.opt.runtimepath:append("~/Projects/playground-project/nvim-ruby-playground")
  local utils = require('utils')
  utils.map('n', '<leader>pl', '<cmd>lua require("nvim-ruby-playground.playground").init()<CR>')


-- Only required if you have packer configured as `opt`
 vim.cmd [[packadd packer.nvim]]

require('packer').startup(function(use)
  -- Mason (tool manager)
  use {
      "williamboman/mason.nvim",
      run = ":MasonUpdate" -- :MasonUpdate updates registry contents
  }
  use 'williamboman/mason-lspconfig.nvim'

  -- Terminal
  use 'vimlab/split-term.vim'

  -- Let Packer manage itself
  use 'wbthomason/packer.nvim'

  -- Color scheme
  -- use 'rakr/vim-one'
  use { "ellisonleao/gruvbox.nvim" }

  -- Code formatting
  use  'sbdchd/neoformat'

  -- Indentation
  use "lukas-reineke/indent-blankline.nvim"

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
  use "jose-elias-alvarez/null-ls.nvim"
  -- "jose-elias-alvarez/nvim-lsp-ts-utils";

  -- Tmux navigation
  use "christoomey/vim-tmux-navigator";

  -- Icons
  use 'ryanoasis/vim-devicons'

  -- Syntax
  use { 'windwp/nvim-autopairs' }
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
  }

  -- Lua development
  use 'nvim-lua/plenary.nvim'
  use 'folke/neodev.nvim'
  use 'rafcamlet/nvim-luapad'
  use 'nvim-lua/completion-nvim'
  use 'euclidianAce/BetterLua.vim'
  use 'jbyuki/one-small-step-for-vimkind'

  -- Debugger
  use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
  use 'leoluz/nvim-dap-go'

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

  -- yaml
  use {
    "cuducos/yaml.nvim",
--    ft = {"yaml"}, -- optional
    requires = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-telescope/telescope.nvim" -- optional
    },
  }

  -- Chat GPT
  use({
    "jackMort/ChatGPT.nvim",
      config = function()
        require("chatgpt").setup({
          -- optional configuration
        })
      end,
      requires = {
        "MunifTanjim/nui.nvim",
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim"
      }
  })
end)
