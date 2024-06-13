return {
    'akinsho/toggleterm.nvim',
    lazy = true,
    event = {'BufEnter'},
    version = "*",
    config = function()
        require('toggleterm').setup({

        })
    end
}
