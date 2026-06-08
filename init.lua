-- Map leader to space
vim.g.mapleader = ','
vim.env.PATH = vim.env.PATH .. ":/opt/homebrew/bin"

-- Install lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  defaults = {
    lazy = true,
    version = nil, -- dont use version="*"
  },
  -- Theme manager
  {
      "vague2k/huez.nvim",
      -- if you want registry related features, uncomment this
      -- import = "huez-manager.import"
      branch = "stable",
      event = "UIEnter",
      config = function()
          require("huez").setup({})
      end,
  },


  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('config.gitsigns')
    end,
  },

  -- Tmux splits integration
  {
    'mrjones2014/smart-splits.nvim',
    config = function()
      require('config.smart-splits')
    end,
  },

  -- Github URL local plugin
  -- { dir = '~/Projects/neovim_github_url' },

  -- Git Conflicts
  {'akinsho/git-conflict.nvim', version = "*", config = true},

  -- Rhai support
  'rhaiscript/vim-rhai',

  -- Color schemes
  {
      'AlexvZyl/nordic.nvim',
      lazy = false,
      priority = 1000,
      config = function()
          require('nordic').load()
      end
  },

  -- Code formatting
   'sbdchd/neoformat',

  -- Indentation
  {
    "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {}
  },

  -- Typescript tools
  {
  "ray-x/lsp_signature.nvim",
  event = "InsertEnter",
  opts = {
    bind = true,
    handler_opts = {
      border = "rounded"
    }
  },
  -- or use config
  -- config = function(_, opts) require'lsp_signature'.setup({you options}) end
  },
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {},
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

    end,
  },
  {
    'folke/trouble.nvim',
    config = function()
      require('config.trouble')
    end
  },
  -- LSP and completion
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
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = "make install_jsregexp"
  },
  {
    'saadparwaiz1/cmp_luasnip'
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
    build = ':TSUpdated',
    config = function()
      require('config.treesitter').setup()
    end,
  },

  -- Lua development
  'nvim-lua/plenary.nvim',
  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
  'rafcamlet/nvim-luapad',
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
 -- {
 --   "zbirenbaum/copilot.lua",
--    cmd = "Copilot",
--    event = "InsertEnter",
--    config = function()
--     require('config.copilot')
--    end,
--  },
--  {
--      "zbirenbaum/copilot-cmp",
--      config = function()
--          require("copilot_cmp").setup()
--      end,
--  },

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

-- Sensible defaults
  require('settings')

-- Key mappings
  require('keymappings')


