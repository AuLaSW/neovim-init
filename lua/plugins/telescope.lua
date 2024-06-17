return {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        'nvim-telescope/telescope-file-browser.nvim',
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
        },
        'BurntSushi/ripgrep',
        'sharkdp/fd',
        'nvim-treesitter/nvim-treesitter',
        'nvim-lua/plenary.nvim',
        'ahmedkhalf/project.nvim',
    },
    tag = '0.1.3',
    lazy = true,
    keys = {
        '<Leader>bf',
        '<Leader>cfz',
        '<Leader>fd',
    },
    config = function (...)
        require('telescope').load_extension('projects')
    end
}
