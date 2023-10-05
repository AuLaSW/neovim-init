return {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        'nvim-telescope/telescope-file-browser.nvim',
        'nvim-telescope/telescope-fzf-native.nvim',
        'nvim-lua/plenary.nvim'
    },
    tag = '0.1.3',
    lazy = true,
    event = 'VeryLazy',
    config = function (...)
        --require('telescope').load_extension('projects')
    end
}
