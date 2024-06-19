return {
    'gorbit99/codewindow.nvim',
    lazy = true,
    even = 'VeryLazy',
    config = function ()
        local codewindow = require('codewindow')
        codewindow.setup()
        codewindow.apply_default_keybinds()
    end
}
