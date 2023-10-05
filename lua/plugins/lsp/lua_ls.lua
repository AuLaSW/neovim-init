return function (T, lang)
    require('plugins.lsp.utils')(
        T,
        lang,
        {
            on_attach = function (client, bufnr)
                client.server_capabilities.semanticTokensProvider = nil
            end
        }
    )
end

