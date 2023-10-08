Keymaps = {}

return {
    dir = vim.fn.stdpath('config').."/custom/keymaps.nvim/",
    lazy = true,
    event = 'VeryLazy',
    config = function (...)
        Keymaps = require('keymaps')
        Keymaps.qol()
    end
}
