return {
    dir = vim.fn.stdpath('config').."/custom/autocommit.nvim/",
    lazy = true,
    config = function (...)
        require('autocommit').hook()
    end
}
