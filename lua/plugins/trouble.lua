return {
    'folke/trouble.nvim',
    lazy = true,
    --event = {'VeryLazy'},
    keys = {
        "<Leader>xx",
        "<Leader>xw",
        "<Leader>xd",
        "<Leader>xq",
        "<Leader>xl",
        "gR",
    },
    opts = {
        fold_open = "v", -- icon used for open folds
        fold_closed = ">", -- icon used for closed folds
        use_diagnostic_signs = true
    },
    config = function (_, opts)
        require('trouble').setup(opts)
    end
}
