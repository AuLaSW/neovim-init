return {
    dir = vim.fn.stdpath('config').."/custom/highlighter.nvim/",
    lazy = true,
    event = 'BufEnter',
    config = function (...)
        require('highlight').setup()
        Keymaps.highlight()
    end
}
