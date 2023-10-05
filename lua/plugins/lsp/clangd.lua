local M = {}

M.run = function (T)
    T.lsp.clangd.setup({
        capabilities = T.capabilities,
        on_attach = on_attach,
        filetypes = {"tpp"}
    })
end

return M
