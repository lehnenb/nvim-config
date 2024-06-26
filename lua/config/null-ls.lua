local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.stylua,
        -- null_ls.builtins.completion.luasnip,
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.formatting.gofmt,
        null_ls.builtins.code_actions.gomodifytags,
        null_ls.builtins.formatting.goimports,
        null_ls.builtins.formatting.goimports_reviser,
        null_ls.builtins.code_actions.impl,
        null_ls.builtins.formatting.rubocop,
        null_ls.builtins.completion.vsnip,
    },
})

