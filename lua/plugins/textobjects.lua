return {
    'nvim-treesitter/nvim-treesitter-textobjects',
    lazy = true,
    event = { 'BufReadPre', 'BufNewfile' },
    opts = {
        textobjects = {
            select = {
                enable = true,
                lookahead = true,
                keymaps = {
                    ['am'] = '@function.outer',
                    ['aM'] = '@function.outer.start',
                    ['im'] = '@function.inner',

                    ['aa'] = '@assignment.outer',
                    ['ia'] = '@assignment.inner',
                    ['la'] = '@assignment.lhs',
                    ['ra'] = '@assignment.rhs',

                    ['ab'] = '@block.outer',
                    ['ib'] = '@block.inner',

                    ['ao'] = '@loop.outer',
                    ['io'] = '@loop.inner',

                    ['ac'] = '@conditional.outer',
                    ['ic'] = '@conditional.inner',

                    ['a['] = '@class.outer',
                    ['i['] = '@class.inner',
                },
                selection_modes = {
                    ['@parameter.outer'] = 'v',
                    ['@function.outer'] = 'V',
                    ['@class.outer'] = '<c-v>',
                },
                include_surrounding_whitespace = true,
            },
            swap = {
                enable = true,
                swap_next = {
                    ['<leader>na'] = '@parameter.inner',
                    ['<leader>nm'] = '@function.outer',
                    ['<leader>nb'] = '@block.outer',
                },
                swap_previous = {
                    ['<leader>pa'] = '@parameter.inner',
                    ['<leader>pm'] = '@function.outer',
                    ['<leader>pb'] = '@block.outer',
                }
            },
            move = {
                enable = true,
                set_jumps = true, -- whether to set jumps in the jumplist
                goto_next_start = {
                    ["]m"] = "@function.outer",
                    ["]]"] = { query = "@class.outer", desc = "Next class start" },
                    --
                    -- You can use regex matching (i.e. lua pattern) and/or pass a list in a "query" key to group multiple queires.
                    -- ["]o"] = { query = { "@loop.inner", "@loop.outer" } }
                    --
                    -- You can pass a query group to use query from `queries/<lang>/<query_group>.scm file in your runtime path.
                    -- Below example nvim-treesitter's `locals.scm` and `folds.scm`. They also provide highlights.scm and indent.scm.
                    --- ["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
                    --- ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
                },
                goto_next_end = {
                    ["]M"] = "@function.outer",
                    ["]["] = "@class.outer",
                },
                goto_previous_start = {
                    ["[m"] = "@function.outer",
                    ["[["] = "@class.outer",
                },
                goto_previous_end = {
                    ["[M"] = "@function.outer",
                    ["[]"] = "@class.outer",
                },
                -- Below will go to either the start or the end, whichever is closer.
                -- Use if you want more granular movements
                -- Make it even more gradual by adding multiple queries and regex.
                goto_next = {
                    ["]c"] = "@conditional.outer",
                    ["]o"] = "@loop.outer",
                },
                goto_previous = {
                    ["[c"] = "@conditional.outer",
                    ["[o"] = "@loop.outer",
                }
            },
        }
    },
    config = function(_, opts)
        require('nvim-treesitter.configs').setup(opts)
    end
}
