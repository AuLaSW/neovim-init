---@diagnostic disable: lowercase-global
local M = {}

function basic_setup()
    require("mason").setup()
    require("mason-lspconfig").setup()
end

function config()
    -- this is the new lsp config
    local config = require('mason')
    local util = require('lspconfig/util')
    -- This fixes issue with capabilities being overwritten when this was performed
    -- in the same section as the cmp. all of that should be moved over to here, now
    local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
    local lsp = require('lspconfig')

    config.setup()

    lsp.ltex.setup({
        capabilities = capabilities,
        on_attach = function()
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

    lsp.lua_ls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
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
