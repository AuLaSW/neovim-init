return {
    'ahmedkhalf/project.nvim',
    lazy = true,
    cmd = "NvimTreeOpen",
    opts = {
        ignore_lsp = {
            'ltext',
        }
    },
    config = function (_, opts)
        require('project_nvim').setup(opts)
        Keymaps.projects()
    end
}
