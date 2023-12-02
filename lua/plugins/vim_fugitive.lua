return {
    'tpope/vim-fugitive',
    dependencies = {
        'sindrets/diffview.nvim',
        {
            dir = vim.fn.stdpath('config').."/custom/autocommit.nvim/"
        },
    },
    lazy = true,
    cmd = {'G'}
}
