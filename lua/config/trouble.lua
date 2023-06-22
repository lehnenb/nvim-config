 -- Lua
vim.api.nvim_set_keymap("n", "<leader>t", "<cmd>Trouble<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<leader>tw", "<cmd>Trouble lsp_workspace_diagnostics<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<leader>td", "<cmd>Trouble document_diagnostics<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<leader>tl", "<cmd>Trouble loclist<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<leader>tq", "<cmd>Trouble quickfix<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "tr", "<cmd>Trouble lsp_references<cr>",
  {silent = true, noremap = true}
)

vim.api.nvim_set_keymap("n", "tn", "<cmd>lua require('trouble').next({skip_groups = true, jump = true})<cr>", {silent = true, noremap = true})

vim.api.nvim_set_keymap("n", "tp", "<cmd>lua require('trouble').previous({skip_groups = true, jump = true})<cr>", {silent = true, noremap = true})


require("trouble").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
}
