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

local utils = require('utils')
utils.map_fn('n', '<leader>dc', dap.continue, { desc = 'DAP: continue' })
utils.map_fn('n', '<leader>dr', dap.step_over, { desc = 'DAP: step over' })
utils.map_fn('n', '<leader>di', dap.step_into, { desc = 'DAP: step into' })
utils.map_fn('n', '<leader>do', dap.step_out, { desc = 'DAP: step out' })
utils.map_fn('n', '<leader>db', dap.toggle_breakpoint, { desc = 'DAP: toggle breakpoint' })
utils.map_fn('n', '<leader>de', dap.repl.open, { desc = 'DAP: open REPL' })

