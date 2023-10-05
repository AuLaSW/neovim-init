local P = require('plugins.lsp.utils')
local M = {}

M.run = function (T, lang)
    P.run(
        T,
        lang,
        {
            on_attach = function (client, bufnr)
                client.server_capabilities.semanticTokensProvider = nil
            end
        }
    )

end

return M

