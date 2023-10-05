local M = {}

M.run = function (T)
    T.lsp.csharp_ls.setup({
        capabilities = T.capabilities,
        on_attach = on_attach,
    })

end

return M

