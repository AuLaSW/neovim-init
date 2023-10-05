local M = {}

M.run = function (T, lang, opts)
    M.opts = {
        capabilities = T.capabilities,
        on_attach = on_attach
    }

    if type(opts) == 'table' then
        vim.tbl_deep_extend(
            'force',
            M.opts,
            T or {}
        )
    end

    T.lsp[lang].setup(M.opts)
end

return M
