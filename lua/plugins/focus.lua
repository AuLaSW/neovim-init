return {
    'nvim-focus/focus.nvim',
    lazy = true,
    event = {'BufEnter'},
    version = '*',
    config = function ()
        require('focus').setup()
    end
}
