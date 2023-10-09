Keymaps = {}

return {
    dir = vim.fn.stdpath('config').."/custom/keymaps.nvim/",
    lazy = false,
    priority = 51,
    config = function (...)
        Keymaps = require('keymaps')
        Keymaps.qol()
    end
}
