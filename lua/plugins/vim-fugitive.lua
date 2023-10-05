return {
    'tpope/vim-fugitive',
    dependencies = {
        'sindrets/diffview.nvim'
    },
    lazy = true,
    cmd = {'G', 'G pull', 'G push', 'G fetch'}
}
