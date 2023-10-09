return {
    'ahmedkhalf/project.nvim',
    dependencies = {
        'nvim-telescope/telescope.nvim',
    },
    lazy = true,
    opts = {
        ignore_lsp = {
            'ltext',
        }
    },
    config = function (_, opts)
        require('project_nvim').setup(opts)
        Keymaps.project()
    end
}
