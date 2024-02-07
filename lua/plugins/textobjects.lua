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
                    ['af'] = '@function.outer',
                    ['if'] = '@function.inner',
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
                    ['<leader>nm'] = '@function.inner',
                },
                swap_previous = {
                    ['<leader>pa'] = '@parameter.inner',
                    ['<leader>pm'] = '@function.inner',
                }
            },
        }
    },
    config = function(_, opts)
        require('nvim-treesitter.configs').setup(opts)
    end
}
