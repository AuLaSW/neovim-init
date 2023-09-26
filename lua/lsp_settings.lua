---@diagnostic disable: lowercase-global
local M = {}

function basic_setup()
    require("mason").setup()
    require("mason-lspconfig").setup(
        {
            ensure_installed = {
                'ltex',
                'clangd',
                'jdtls',
                'cmake',
                --'csharp_ls',
                'pylsp',
                'lua_ls',
                'vimls',
                'quick_lint_js',
                'html',
                'cssls',
                'marksman',
            },

        }
    )
end

function config()
    -- utils required for root_pattern
    local util = require('lspconfig/util')
    -- This fixes issue with capabilities being overwritten when this was performed
    -- in the same section as the cmp. all of that should be moved over to here, now
    local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
    local lsp = require('lspconfig')

    lsp.ltex.setup({
        capabilities = capabilities,
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
        root_dir = util.root_pattern('.git'),
    })

    lsp.clangd.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        filetypes = {"tpp"}
    })

    lsp.jdtls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
    })

    lsp.cmake.setup({
        capabilities = capabilities,
        on_attach = on_attach,
    })

    lsp.csharp_ls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
    })

    lsp.pylsp.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
            pylsp = {
                plugins = {
                    autopep8 = {
                        enabled = true,
                    },
                    pylsp_mypy = {
                        enabled = true,
                        live_mode = true,
                        report_progress = true,
                    },
                    pyflakes = {
                        enabled = false,
                    },
                    flake8 = {
                        enabled = true,
                    },
                    pylint = {
                        enabled = true,
                        executable = 'pylint',
                        args = { '--rcfile=' .. vim.fn.getcwd() .. '\\.config\\.pylintrc' }
                    },
                    rope = {
                        enabled = true,
                    }
                }
            }
        },
    })

    lsp.lua_ls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
    })

    lsp.quick_lint_js.setup({
        capabilities = capabilities,
        on_attach = on_attach
    })

    lsp.html.setup({
        capabilities = capabilities,
        on_attach = on_attach
    })

    lsp.cssls.setup({
        capabilities = capabilities,
        on_attach = on_attach
    })

    lsp.marksman.setup({
        capabilities = capabilities,
        on_attach = function (client, bufnr)
            --client.server_capabilities.semanticTokensProvider = nil
        end
    })

    lsp.vimls.setup({
        capabilities = capabilities,
        on_attach = on_attach
    })
end

function diagnostic_config()
    vim.diagnostic.config({
        virtual_text = false,
        update_in_insert = true,
        underline = true,
    })
end


function M.setup()
    basic_setup()
    config()
    diagnostic_config()
end

return M
