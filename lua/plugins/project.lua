return {
    'ahmedkhalf/project.nvim',
    dependencies = {
        'nvim-telescope/telescope.nvim',
    },
    lazy = true,
    cmd = "NvimTreeOpen",
    keys = '<Leader>tp',
    opts = {
        ignore_lsp = {
            'ltext',
        }
    },
    config = function (_, opts)
        require('project_nvim').setup(opts)
    end
}
