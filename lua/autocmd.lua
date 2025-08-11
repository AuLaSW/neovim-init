vim.api.nvim_create_autocmd(
    { 'BufEnter' },
    {
        pattern = { '*.md', '*.book' },
        callback = function()
            vim.opt.colorcolumn = "65"
        end,
    }
)

vim.api.nvim_create_autocmd(
    { 'BufLeave' },
    {
        pattern = { '*.md', '*.book' },
        callback = function()
            vim.opt.colorcolumn = "80"
        end,
    }
)

vim.api.nvim_create_autocmd(
    { "LspAttach" },
    {
        pattern = { '*.go' },
        group = vim.api.nvim_create_augroup("lsp", { clear = true }),
        callback = function (args)
            vim.api.nvim_create_autocmd("BufWritePre", {
                buffer = args.buf,
                callback = function ()
                    local params = vim.lsp.util.make_range_params()
                    params.context = {only = {"source.organizeImports"}}
                    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
                    for cid, res in pairs(result or {}) do
                        for _, r in pairs(res.result or {}) do
                            if r.edit then
                                local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
                                vim.lsp.util.apply_workspace_edit(r.edit, enc)
                            end
                        end
                    end
                    vim.lsp.buf.format({
                        async = false,
                        id = args.data.client_id
                    })
                end
            })
        end
    }
)
