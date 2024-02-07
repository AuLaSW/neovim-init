return function (T, lang)
    require('plugins.lsp.utils')(
        T,
        lang,
        {
            diagnositcs = {
                enable = true;
            },
            checkOnSave = {
                command = "clippy",
            }
        }
    )
end
