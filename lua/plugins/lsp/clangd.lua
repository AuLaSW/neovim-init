return function (T, lang)
    require('plugins.lsp.utils')(
        T,
        lang,
        {
            filetypes = {"tpp"}
        }
    )
end
