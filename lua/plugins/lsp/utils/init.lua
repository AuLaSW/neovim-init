return function (T, lang, opts)
    local config = {
        capabilities = T.capabilities,
        on_attach = on_attach
    }

    if type(opts) == 'table' then
        vim.tbl_deep_extend(
            'force',
            config,
            opts or {}
        )
    end

    T.lsp[lang].setup(config)
end

