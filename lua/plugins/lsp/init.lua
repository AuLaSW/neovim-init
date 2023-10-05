return {
    'williamboman/mason.nvim',
    build = ':MasonUpdate',
    dependencies = {
        'williamboman/mason-lspconfig.nvim',
        'neovim/nvim-lspconfig',
        'neovim/nvim-lspconfig'
    },
    lazy = true,
    event = "BufEnter",
    config = function (...)
        local servers = {
            'ltex',
            'clangd',
            'jdtls',
            'cmake',
            'pylsp',
            'lua_ls',
            'quick_lint_js',
            'html',
            'cssls',
            'marksman',
        }

        require('mason').setup()
        require('mason-lspconfig').setup(
            { ensure_installed = servers, }
        )

        local T = {
            -- util required for root_pattern
            util = require('lspconfig/util'),
            capabilities = require('cmp_nvim_lsp')
                .default_capabilities(
                    vim.lsp.protocol.make_client_capabilities()
                ),
            lsp = require('lspconfig'),
        }

        for _, server in ipairs(servers) do
            require('plugins.lsp.'..server).run(T)
        end

        vim.diagnostic.config({
            virtual_text = false,
            update_in_insert = true,
            underline = true,
        })
    end
}
