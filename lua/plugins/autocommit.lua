return {
    dir = vim.fn.stdpath('config').."/custom/autocommit.nvim/",
    lazy = true,
    config = function (...)
        AutoCommit = require('autocommit')
    end
}
