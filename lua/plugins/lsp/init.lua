return {
    'williamboman/mason.nvim',
    build = ':MasonUpdate',
    dependencies = {
        'williamboman/mason-lspconfig.nvim',
        'neovim/nvim-lspconfig',
        'neovim/nvim-lspconfig',
        'barreiroleo/ltex_extra.nvim',
    },
    lazy = true,
    event = {"BufReadPost", "BufNewFile"},
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

        local key_opts = { silent = true, noremap = true }

        -- setup keymaps
        -- open float
        vim.keymap.set('n', '<space>e', function()
            vim.diagnostic.open_float()
        end, key_opts)
        -- set loclist
        vim.keymap.set('n', '<space>q', function() vim.diagnostic.setloclist() end, key_opts)

        -- go to previous
        vim.keymap.set('n', '[d', function() vim.diagnostic.goto_prev() end, key_opts)
        -- go to next
        vim.keymap.set('n', ']d', function() vim.diagnostic.goto_next() end, key_opts)

        -- jumping --
        -- jump to symbol declaration
        vim.keymap.set('n', 'gD', function() vim.lsp.buf.declaration() end, key_opts)
        -- jump to symbol definition
        vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, key_opts)
        -- jump to type definition
        vim.keymap.set('n', '<leader>D', function() vim.lsp.buf.type_definition() end, key_opts)

        -- list jumping --
        -- list all implementations in quickfix window
        vim.keymap.set('n', 'gi', function() vim.lsp.buf.implementation() end, key_opts)
        -- list all references in quickfix window
        vim.keymap.set('n', 'gr', function() vim.lsp.buf.references() end, key_opts)
        vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, key_opts)
        vim.keymap.set('n', '<C-k>', function() vim.lsp.buf.signature_help() end, key_opts)
        vim.keymap.set('n', '<leader>wa', function() vim.lsp.buf.add_workspace_folder() end, key_opts)
        vim.keymap.set('n', '<leader>wr', function() vim.lsp.buf.remove_workspace_folder() end, key_opts)
        vim.keymap.set('n', '<leader>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, key_opts)

        -- code --
        vim.keymap.set('n', '<leader>rn', function() vim.lsp.buf.rename() end, key_opts)
        vim.keymap.set('n', '<leader>ca', function() vim.lsp.buf.code_action() end, key_opts)
        vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.formatting() end, key_opts)
    end
}
