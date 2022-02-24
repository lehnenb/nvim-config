-- Map leader to space
vim.g.mapleader = ','

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
  require('config.cmp')
  require('config.lspkind')
  require('config.vim-snip')

require 'paq-nvim' {
    -- Terminal
    'vimlab/split-term.vim';

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
    'golang/vscode-go';
    'hrsh7th/nvim-cmp';
    'hrsh7th/cmp-nvim-lsp';
    'hrsh7th/cmp-buffer';
    'hrsh7th/cmp-path';
    'hrsh7th/cmp-cmdline';
    'neovim/nvim-lspconfig';
    'hrsh7th/cmp-vsnip';
    'hrsh7th/vim-vsnip';
    'hrsh7th/vim-vsnip-integ';
    'glepnir/lspsaga.nvim';
    -- "jose-elias-alvarez/null-ls.nvim";
    -- "jose-elias-alvarez/nvim-lsp-ts-utils";

    -- Tmux navigation
    "christoomey/vim-tmux-navigator";

    -- Icons
    'ryanoasis/vim-devicons';

    -- Lua development
    'folke/lua-dev.nvim';
    'tjdevries/nlua.nvim';

    -- Vim dispatch
    'tpope/vim-dispatch';

    -- Fugitive for Git
    'tpope/vim-fugitive';

    -- Status bar
    'vim-airline/vim-airline';
    'vim-airline/vim-airline-themes';

    -- Error colors
    'folke/lsp-colors.nvim';

    -- Lint integration
    'dense-analysis/ale';

    -- Vimwiki
    'vimwiki/vimwiki'

}

require("trouble").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
}
