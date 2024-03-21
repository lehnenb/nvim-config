vim.g.copilot_no_tab_map = true

vim.g.copilot_filetypes = {
  ["*"] = false,
  ["javascript"] = true,
  ["typescript"] = true,
  ["lua"] = true,
  ["rust"] = true,
  ["c"] = true,
  ["c#"] = true,
  ["c++"] = true,
  ["go"] = true,
  ["python"] = true,
  ["ruby"] = true,
}

vim.api.nvim_set_keymap(
  "i", "<C-c>", 'copilot#Accept("<CR>")',
  { silent = true, expr = true }
)
