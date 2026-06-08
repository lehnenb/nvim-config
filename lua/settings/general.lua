  vim.o.autoread = true
  vim.o.autowrite = true

  vim.api.nvim_create_autocmd({"FocusGained", "BufEnter", "CursorHold", "CursorHoldI"}, {
      command = "checktime"
  })

