require('lualine').setup {
  options = {
    theme = 'nordic'
  },
  sections = {
    lualine_c = { { 'filename', path = 1 } }
  }
}
