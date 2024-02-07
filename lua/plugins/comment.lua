return {
    'numToStr/Comment.nvim',
    tag = 'v0.8.0',
    lazy = true,
    event = 'BufEnter',
    config = function (_, opts)
        require('Comment').setup(opts)

        local ft = require('Comment.ft')

        ft.lua = {'---%s', '---[[%s---]]'}

        require('Comment').setup()
    end
}
