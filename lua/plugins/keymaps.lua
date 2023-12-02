return {
    --dir = vim.fn.stdpath('config').."/custom/keymaps.nvim/",
    'AuLaSW/keymaps.nvim',
    lazy = false,
    priority = 51,
    config = function (...)
        Keymaps = require('keymaps')
        Keymaps.qol()
    end
}
