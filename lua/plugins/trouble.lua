return {
    'folke/trouble.nvim',
    lazy = true,
    event = {'VeryLazy'},
    config = function (_, opts)
        require('trouble').setup(opts)
    end
}
