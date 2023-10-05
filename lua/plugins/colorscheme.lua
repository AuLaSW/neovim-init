return {
    'luisiacc/gruvbox-baby',
    branch = 'main',
    lazy = false,
    priority = 1000,
    config = function(_, opts)
        vim.cmd[[colorscheme gruvbox-baby]]
    end,
}
