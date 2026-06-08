local utils = require('utils')
utils.map('n', '<Leader>yv', '<cmd>YAMLView<CR>', { desc = 'YAML: view value' })
utils.map('n', '<Leader>yr', '<cmd>YAMLYank r<CR>', { desc = 'YAML: yank value' })
utils.map('n', '<Leader>yt', '<cmd>YAMLTelescope<CR>', { desc = 'YAML: telescope' })
