local api = vim.api

api.nvim_create_autocmd(
    {'BufEnter'},
    {
        pattern = { '*.md', '*.book' },
        callback = function()
            vim.opt.colorcolumn = "65"
        end,
    }
)

api.nvim_create_autocmd(
    {'BufLeave'},
    {
        pattern = { '*.md', '*.book' },
        callback = function()
            vim.opt.colorcolumn = "80"
        end,
    }
)
