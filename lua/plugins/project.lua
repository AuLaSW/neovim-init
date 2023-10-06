return {
    'ahmedkhalf/project.nvim',
    lazy = true,
    event = 'VeryLazy',
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
