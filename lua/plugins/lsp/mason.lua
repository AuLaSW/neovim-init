return {
    'williamboman/mason.nvim',
    build = ':MasonUpdate',
    dependencies = {
        'williamboman/mason-lspconfig.nvim',
        'neovim/nvim-lspconfig',
        'neovim/nvim-lspconfig'
    },
    lazy = false,
    config = function (...)
    end
}
