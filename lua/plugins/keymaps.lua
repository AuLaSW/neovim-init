return {
    dir = vim.fn.stdpath('config').."/custom/keymaps.nvim/",
    lazy = true,
    event = 'VeryLazy',
    config = function (...)
        require('keymaps').setup()
    end
}
