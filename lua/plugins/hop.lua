return {
    'smoka7/hop.nvim',
    lazy = true,
    event = {'BufReadPre', 'BufNewFile'},
    opts = {},
    config = function(...)
        require('hop').setup({
            keys = 'fjrudkeislwo',
        })
    end,
}
