return {
    'hrsh7th/nvim-cmp',
    lazy = true,
    event = {'InsertEnter', 'CmdlineEnter'},
    dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        {
            'SirVer/ultisnips',
            dependencies = {
                'quangnguyen30192/cmp-nvim-ultisnips',
                --- 'rstacruz/vim-hyperstyle',
                'honza/vim-snippets'
            }
        },
        'williamboman/mason.nvim',
    },
    config = function(...)
        local cmp = require('cmp')

        cmp.setup({
            snippet = {
                -- REQUIRED - you must specify a snippet engine
                expand = function(args)
                    vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
                end,
            },
            mapping = {},

            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'ultisnips' }, -- For ultisnips users.
            },
            {
                { name = 'buffer' },
            }
            )
        })
        -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore). cmp.setup.cmdline('/', {
        cmp.setup.cmdline(
            '/',
            {
                sources = {
                    { name = 'buffer' }
                }
            }
        )

        -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline(
            ':',
            {
                sources = cmp.config.sources({
                    {
                        name = 'path'
                    }
                },
                {
                    { name = 'cmdline' }
                })
            }
        )

        cmp.setup.filetype({
            "dap-repl",
            "dapui_watches",
            "dapui_hover",
        },
        {
            sources = {
                { name = "dap" },
            },
        })
    end
}
