-- Setup Different languages
  require('dap-go').setup()

-- Debugger
  local dap = require('dap')


-- Dapui

require("dapui").setup({
  layouts = {
    {
      elements = {
        { id = "scopes", size = 0.25 },
        { id = "breakpoints", size = 0.25 },
        { id = "stacks", size = 0.25 },
        { id = "watches", size = 0.25 },
      },
      size = 40,
      position = "left",
    },
    {
      elements = {},
      size = 10,
      position = "bottom",
    },
  },
})

local dapui = require("dapui")

dap.listeners.after.event_initialized["dapui_config"]=function()
  dapui.open()
end

dap.listeners.before.event_terminated["dapui_config"]=function()
  dapui.close()
end

dap.listeners.before.event_exited["dapui_config"]=function()
  dapui.close()
end

-- Keybindings

vim.fn.sign_define('DapBreakpoint',{ text ='🟥', texthl ='', linehl ='', numhl =''})
vim.fn.sign_define('DapStopped',{ text ='▶️', texthl ='', linehl ='', numhl =''})

vim.keymap.set('n', '<leader>dc', dap.continue)
vim.keymap.set('n', '<leader>dr', dap.step_over)
vim.keymap.set('n', '<leader>di', dap.step_into)
vim.keymap.set('n', '<leader>do',  dap.step_out)
vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint)
vim.keymap.set('n', '<leader>de', dap.repl.open)

