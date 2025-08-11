return {
    'lommix/godot.nvim',
    lazy = false,
    config = function(...)
        require('godot').setup({})
    end,
}
