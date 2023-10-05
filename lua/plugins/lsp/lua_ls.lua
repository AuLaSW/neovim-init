local M = {}

M.run = function (T)
    T.lsp.lua_ls.setup({
        capabilities = T.capabilities,
        on_attach = function (client, bufnr)
            client.server_capabilities.semanticTokensProvider = nil
        end
    })

end

return M

