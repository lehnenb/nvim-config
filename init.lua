-- Map leader to space
vim.g.mapleader = ','

-- Sensible defaults
  require('settings')

-- Key mappings
  require('keymappings')

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
	defaults = {
		lazy = true,
		version = nil, -- dont use version="*"
	},
	  -- Tmux
	 {
	  'christoomey/vim-tmux-navigator',
	  event = "BufReadPre",
	 },

  -- Rhai support
  'rhaiscript/vim-rhai',

  -- Mason (tool manager)
  {
    "williamboman/mason.nvim",
    config = function()
       -- :MasonUpdate updates registry contents
       require('config.mason')
    end,
    build = function()
       vim.cmd('MasonUpdate')
    end
  },

  'williamboman/mason-lspconfig.nvim',

  -- Color scheme
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      require('config.colorscheme')
    end
  },

  -- Code formatting
   'sbdchd/neoformat',

  -- Indentation
  {
    "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {}
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
  'hrsh7th/cmp-nvim-lua',
  'hrsh7th/cmp-cmdline',
  {
    'neovim/nvim-lspconfig',
    config = function()
      require('lsp')
    end,
  },
  -- "jose-elias-alvarez/nvim-lsp-ts-utils";

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
    end,
    build = function()
      vim.cmd(':TSUpdate');
    end
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

  -- Vim dispatch
  'tpope/vim-dispatch',

  -- Fugitive for Git
  {
    'tpope/vim-fugitive',
    config = function()
      require('config.fugitive')
    end,
  },

  -- Git source for CMP
  {
    "petertriho/cmp-git",
    config = function()
      require('config.cmp-git')
    end,
    dependencies = {
      "nvim-lua/plenary.nvim"
    },
  },

  -- Copilot
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require('config.copilot')
    end,
  },
  {
      "zbirenbaum/copilot-cmp",
      config = function()
          require("copilot_cmp").setup()
      end,
  },

  -- Status bar
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('config.lualine')
    end,
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

  {
    'sindrets/diffview.nvim'
  }
})
