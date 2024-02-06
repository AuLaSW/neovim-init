return {
    'numToStr/Comment.nvim',
    tag = 'v0.6',
    lazy = true,
    event = 'BufEnter',
    config = function (...)
        local ft = require('Comment.ft')

        ft.lua = {'---%s', '---[[%s---]]'}

        require('Comment').setup()
    end
}
