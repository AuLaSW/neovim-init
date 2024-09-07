vim.api.nvim_create_autocmd(
    {'BufEnter'},
    {
        pattern = { '*.md', '*.book' },
        callback = function()
            vim.opt.colorcolumn = "65"
        end,
    }
)

vim.api.nvim_create_autocmd(
    {'BufLeave'},
    {
        pattern = { '*.md', '*.book' },
        callback = function()
            vim.opt.colorcolumn = "80"
        end,
    }
)

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("lsp", { clear = true }),
    callback = function (args)
        vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = args.buf,
            callback = function ()
                vim.lsp.buf.format({
                    async = false,
                    id = args.data.client_id
                })
            end
        })
    end
})
