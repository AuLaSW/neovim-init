return {
    'nvim-focus/focus.nvim',
    lazy = true,
    event = {'BufEnter'},
    version = '*',
    config = function ()
        require('focus').setup({
            autoresize = {
                enable = false,
                minwidth = 35,
                minheight = 8,
                height = 60,
            }
        })
    end
}
