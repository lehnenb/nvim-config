local N = {}
local utils = require('utils')
local themes = require('telescope.themes')
local previewers = require('telescope.previewers')
local a = require "plenary.async"

 function OLDwriteToFile(path, text)
    local err, fd = a.uv.fs_open(path, "w+", 438)
    assert(not err, err)

    err, fd = a.uv.fs_write(fd, text)
    assert(not err, err)


    err = a.uv.fs_close(fd)
    assert(not err, err)
end

function N.NewNote()
    local timestamp = os.date("%d%m%y%H%M%S")
    local title = vim.fn.input({ prompt = 'Title of note: ' })
    local filepath = string.format("~/notes/%s-%s.md", timestamp, string.gsub(title, ' ', '-'))
    os.execute(string.format('echo "# %s" > %s', title, filepath))


    vim.cmd("vnew "..filepath)
end

function N.ListNotes()
    local options = themes.get_dropdown {
        prompt = " - Dotfiles  - ",
        winblend = 10,
        border = true,
        previewer = previewers.buffer_previewer,
        shorten_path = false,
        cwd = "~/notes"
    }


    require('telescope.builtin').find_files(options)
end


utils.map('n', '<leader>tn', '<cmd>lua require("custom_plugins.notes").NewNote()<CR>')
utils.map('n', '<leader>fn', '<cmd>lua require("custom_plugins.notes").ListNotes()<CR>')


return N
