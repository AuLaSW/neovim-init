return {
    'nvim-treesitter/nvim-treesitter-textobjects',
    lazy = true,
    event = {'BufReadPre', 'BufNewFile'},
    opts = {
        textobjects = {
            select = {
                enable = true,
                lookahead = true,
                keymaps = {
                    ['saf'] = '@function.outer',
                    ['saF'] = '@function.outer.start',
                    ['sif'] = '@function.inner',

                    ['saa'] = '@assignment.outer',
                    ['sia'] = '@assignment.inner',
                    ['sla'] = '@assignment.lhs',
                    ['sra'] = '@assignment.rhs',

                    ['sab'] = '@block.outer',
                    ['sib'] = '@block.inner',

                    ['sal'] = '@loop.outer',
                    ['sil'] = '@loop.inner',

                    ['sac'] = '@conditional.outer',
                    ['sic'] = '@conditional.inner',

                    ['sa['] = '@class.outer',
                    ['si['] = '@class.inner',
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
                    ['swp'] = '@parameter.inner',
                    ['swf'] = '@function.outer',
                    ['swb'] = '@block.outer',
                },
                swap_previous = {
                    ['swP'] = '@parameter.inner',
                    ['swF'] = '@function.outer',
                    ['swB'] = '@block.outer',
                }
            },
            move = {
                enable = true,
                set_jumps = true, -- whether to set jumps in the jumplist
                goto_next_start = {
                    ["]f"] = "@function.outer",
                    ["]]"] = { query = "@class.outer", desc = "Next class start" },
                },
                goto_next_end = {
                    ["]F"] = "@function.outer",
                    ["]["] = "@class.outer",
                },
                goto_previous_start = {
                    ["[f"] = "@function.outer",
                    ["[["] = "@class.outer",
                },
                goto_previous_end = {
                    ["[F"] = "@function.outer",
                    ["[]"] = "@class.outer",
                },
                goto_next = {
                    ["]c"] = "@conditional.outer",
                    ["]l"] = "@loop.outer",
                },
                goto_previous = {
                    ["[c"] = "@conditional.outer",
                    ["[l"] = "@loop.outer",
                }
            },
        }
    },
    config = function(_, opts)
        require('nvim-treesitter.configs').setup(opts)
    end
}
