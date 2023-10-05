local M = {}

M.run = function (T)
    T.lsp.jdtls.setup({
        capabilities = T.capabilities,
        on_attach = on_attach,
    })

end

return M

