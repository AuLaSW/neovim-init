return {
    'hrsh7th/nvim-cmp',
    lazy = false,
    dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'SirVer/ultisnips',
        'quangnguyen30192/cmp-nvim-ultisnips',
        'williamboman/mason.nvim',
    },
    config = function(...)
        local cmp = require('cmp')

        cmp.setup({
            snippet = {
                -- REQUIRED - you must specify a snippet engine
                expand = function(args)
                    -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
                    -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                    vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
                    -- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
                end,
            },
            mapping = {
                ['<C-L>'] = cmp.mapping.confirm({ select = true }),
                ['<C-J>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
                ['<C-K>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
                ['<Down>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
                ['<Up>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
                ['<C-D>'] = cmp.mapping.scroll_docs(-4),
                ['<C-U>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-E>'] = cmp.mapping.close(),
                ['<C-L>'] = cmp.mapping.confirm({
                    behavior = cmp.ConfirmBehavior.Replace,
                    select = true,
                })
            },

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
