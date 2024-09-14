return function(T, lang)
    require('plugins.lsp.utils')(
        T,
        lang,
        {
            settings = {
                gopls = {
                    hints = {
                        rangeVariableTypes = true,
                    }
                }
            }
        }
    )
end
