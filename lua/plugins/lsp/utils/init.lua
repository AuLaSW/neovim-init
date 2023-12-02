return function (T, lang, opts)
    local config = {
        capabilities = T.capabilities,
        on_attach = on_attach,
    }

    config = vim.tbl_deep_extend(
        'force',
        config,
        opts or {}
    )

    T.lsp[lang].setup(config)
end

