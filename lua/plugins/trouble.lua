return {
    'folke/trouble.nvim',
    lazy = true,
    --event = {'VeryLazy'},
    keys = {
        "<Leader>xx",
        "<Leader>xw",
        "<Leader>xd",
        "<Leader>xq",
        "<Leader>xl",
        "gR",
    },
    opts = {
        icons = false,
        fold_open = "v", -- icon used for open folds
        fold_closed = ">", -- icon used for closed folds
        signs = {
            -- icons / text used for a diagnostic
            error = "",
            warning = "",
            hint = "",
            information = ""
        },
        use_diagnostic_signs = true
    },
    config = function (_, opts)
        require('trouble').setup(opts)
        local api = require('trouble')

        vim.keymap.set({ 'n', 'v' }, '<Leader>xx', function() api.open() end)
        vim.keymap.set({ 'n', 'v' }, '<Leader>xw', function() api.open('workspace_diagnostics') end)
        vim.keymap.set({ 'n', 'v' }, '<Leader>xd', function() api.open('document_diagnostics') end)
        vim.keymap.set({ 'n', 'v' }, '<Leader>xq', function() api.open('quickfix') end)
        vim.keymap.set({ 'n', 'v' }, '<Leader>xl', function() api.open('loclist') end)
        vim.keymap.set({ 'n', 'v' }, 'gR', function() api.open('lsp_references') end)
    end
}
