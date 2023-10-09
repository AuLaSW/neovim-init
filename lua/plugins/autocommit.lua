return {
    dir = vim.fn.stdpath('config').."/custom/autocommit.nvim/",
    lazy = true,
    keys = '<Leader>ac',
    config = function (...)
        AutoCommit = require('autocommit')
        Keymaps.autocommit()
    end
}
