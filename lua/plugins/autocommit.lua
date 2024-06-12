return {
    --dir = vim.fn.stdpath('config').."/custom/autocommit.nvim/",
    'AuLaSW/autocommit.nvim',
    dependencies = {
        'tpope/vim-fugitive',
    },
    lazy = true,
    config = function (...)
        require('autocommit').setup({})
        local ac = require('autocommit')

        vim.keymap.set(
            'n',
            '<Leader>ac',
            function()
                ac.hook()
            end,
            {
                desc = "Set saving commit hook for this buffer"
            }
        )
    end
}
