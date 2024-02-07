return {
    'smoka7/hop.nvim',
    lazy = true,
    event = {'BufReadPre', 'BufNewFile'},
    opts = {},
    config = function(...)
        require('hop').setup({
            keys = 'fjrudkeislwo',
        })

        local hop = require('hop')

        --- hop to any word in the buffer
        vim.keymap.set({'n'}, '<leader>w', function ()
            hop.hint_words()
        end)

        --- hop to any bigram or monogram within the buffer
        vim.keymap.set({'n'}, '<leader>c', function ()
            hop.hint_char2()
        end)

        --- hop to any line start
        vim.keymap.set({'n'}, '<leader>s', function ()
            hop.hint_lines_skip_whitespace()
        end)
    end,
}
