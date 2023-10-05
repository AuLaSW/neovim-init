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
            local server_name = 'plugins.lsp.'..server
            local utils = 'plugins.lsp.utils'

            if pcall(require, server_name) then
                require(server_name)(
                    T,
                    server
                )
            else
                -- if we don't have a file for this server,
                -- then create a basic setup for the server
                require(utils)(
                    T,
                    server,
                    {}
                )
            end
        end

        vim.diagnostic.config({
            virtual_text = false,
            update_in_insert = true,
            underline = true,
        })
    end
}
