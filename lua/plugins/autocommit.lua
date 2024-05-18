return {
    --dir = vim.fn.stdpath('config').."/custom/autocommit.nvim/",
    'AuLaSW/autocommit.nvim',
    dependencies = {
        'tpope/vim-fugitive',
    },
    lazy = true,
    config = function (...)
        local wk = require('which-key')

        require('autocommit').setup({})
        local ac = require('autocommit')

        --- vim.keymap.set('n', '<Leader>ac', function() ac.hook() end)
        wk.register( {
            ['<leader>ac'] = {
                function ()
                    ac.hook()
                end,
                "Attach the autocommit hook to the current buffer"
            }
        })
    end
}
