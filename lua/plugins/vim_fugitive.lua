return {
    'tpope/vim-fugitive',
    dependencies = {
        'sindrets/diffview.nvim',
        vim.fn.stdpath('config').."/custom/autocommit.nvim/",
    },
    lazy = true,
    cmd = {'G'}
}
