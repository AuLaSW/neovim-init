return {
    --dir = vim.fn.stdpath('config').."/custom/highlighter.nvim/",
    'AuLaSW/highlighter.nvim',
    lazy = true,
    event = 'BufEnter',
    config = function (...)
        require('highlight').setup()
    end
}
