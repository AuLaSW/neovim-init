local M = {}

M.run = function (T)
    T.lsp.quick_lint_js.setup({
        capabilities = T.capabilities,
        on_attach = on_attach
    })

end

return M

