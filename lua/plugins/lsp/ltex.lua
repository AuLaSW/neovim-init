local M = {}

M.run = function (T)
    T.lsp.ltex.setup(
        {
            capabilities = T.capabilities,
            on_attach = function(client, bufnr)
                --client.server_capabilities.semanticTokensProvider = nil
                require("ltex_extra").setup({
                    path = 'spell/',
                    --log_level = "trace",
                    init_check = true,
                    load_langs = {'en-US'}
                })
            end,
            cmd = {'ltex-ls'},
            filetypes = {'latex', 'book', 'markdown', 'text'},
            flags = {debounce_text_changes=300},
            root_dir = T.util.root_pattern('.git'),
        }
    )
end

return M

