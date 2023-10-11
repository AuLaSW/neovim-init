return {
    --dir = vim.fn.stdpath('config').."/custom/autocommit.nvim/",
    'AuLaSW/autocommit.nvim',
    dependencies = {
        'tpope/vim-fugitive',
    },
    lazy = true,
    keys = '<Leader>ac',
    config = function (...)
        require('autocommit').setup({})
        Keymaps.autocommit()
    end
}
