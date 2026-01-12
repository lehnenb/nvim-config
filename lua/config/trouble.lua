 -- Lua

vim.api.nvim_set_keymap("n", "<leader>td", "<cmd>Trouble diagnostics toggle<cr>",
  {silent = true, noremap = true}
)

vim.api.nvim_set_keymap("n", "<leader>tl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
  {silent = true, noremap = true}
)

require("trouble").setup {
    auto_preview = true,
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
}
