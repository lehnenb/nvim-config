-- Map leader to space
vim.g.mapleader = ','

-- Sensible defaults
  require('settings')

-- Key mappings
   require('keymappings')

-- Loads config files

-- Indent

-- Custom plugins
--  require('custom_plugins.notes')

-- Playground
--  vim.opt.runtimepath:append("~/Projects/playground-project/nvim-ruby-playground")
--  local utils = require('utils')
--  utils.map('n', '<leader>pl', '<cmd>lua require("nvim-ruby-playground.playground").init()<CR>')


-- Only required if you have packer configured as `opt`
-- local pack_cmd = [[packadd packer.nvim]]
--  vim.cmd(pack_cmd)


-- Install lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  -- Mason (tool manager)
  {
    "williamboman/mason.nvim",
    config = function()
       -- :MasonUpdate updates registry contents
       require('config.mason')
       vim.cmd("MasonUpdate")
    end,
  },

  'williamboman/mason-lspconfig.nvim',

  -- Color scheme
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require('config.colorscheme')
    end,
  },

  -- Code formatting
   'sbdchd/neoformat',

  -- Indentation
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require('config.indent-blankline')
    end
  },

  -- Pictograms
  {
    'onsails/lspkind-nvim',
     config = function()
	require('lspkind').init()
     end
  },

  -- Fuzzy file finder
  'nvim-lua/popup.nvim',
  { 
    'nvim-telescope/telescope.nvim',
    config = function()
      require('config.telescope')
    end,
  },

  -- File explorer
  { 
    'kyazdani42/nvim-tree.lua',
    config = function()
      require('config.nvim-tree')
    end,
  },

  -- Enclosing characters utility
  'tpope/vim-surround',

  -- Diagnostics
  { 
    'kyazdani42/nvim-web-devicons',
    config = function()
      require('config.nvim-web-devicons')
    end,
  },
  { 
    'folke/trouble.nvim',
    config = function()
      require('config.trouble')
    end
  },

  -- LSP and completion
  'ray-x/lsp_signature.nvim',
  'golang/vscode-go',
  { 
    'hrsh7th/nvim-cmp',
    config = function()
      require('config.cmp')
    end
  },
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  { 
    'neovim/nvim-lspconfig',
    config = function()
      require('lsp')
    end,
  },
  'hrsh7th/cmp-vsnip',
  { 
    'hrsh7th/vim-vsnip',
    config = function()
      require('config.vim-snip')
    end,
  },
  'hrsh7th/vim-vsnip-integ',
  { 
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      require('config.null-ls')
    end,
  },
  -- "jose-elias-alvarez/nvim-lsp-ts-utils";

  -- Tmux navigation
  "christoomey/vim-tmux-navigator",

  -- Icons
  'ryanoasis/vim-devicons',

  -- Syntax
  { 
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup{}
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require('config.treesitter')
      vim.cmd(':TSUpdate');
    end,
  },

  -- Lua development
  'nvim-lua/plenary.nvim',
  { 
    'folke/neodev.nvim',
    config = function()
      require('config.neodev')
    end,
  },
  'rafcamlet/nvim-luapad',
  'nvim-lua/completion-nvim',
  'euclidianAce/BetterLua.vim',
  'jbyuki/one-small-step-for-vimkind',

  -- Debugger
  { "rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap"} },
  {
    'leoluz/nvim-dap-go',
    config = function()
      require('config.dap')
    end
  },

  -- Vim dispatch
  'tpope/vim-dispatch',

  -- Fugitive for Git
  {
    'tpope/vim-fugitive',
    config = function()
      require('config.fugitive')
    end,
  },

  -- Status bar
  {
    'nvim-lualine/lualine.nvim',
  },
  -- Error colors
  'folke/lsp-colors.nvim',

  -- Lint integration
  'mfussenegger/nvim-lint',

  -- yaml
  {
    "cuducos/yaml.nvim",
     config = function()
       require('config.yaml')
     end,
     dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-telescope/telescope.nvim" -- optional
    },
  },
})
