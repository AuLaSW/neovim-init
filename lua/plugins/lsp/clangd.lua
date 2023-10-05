local M = {}
local P = require('plugins.lsp.utils')

M.run = function (T, lang)
    P.run(
        T,
        lang,
        {
            filetypes = {"tpp"}
        }
    )
end

return M
