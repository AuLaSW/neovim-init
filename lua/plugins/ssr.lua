-- this plugin is a Structure Search and Replace plugin
-- it allows us to use treesitter to replace structural
-- objects within a file that we are working on, it
-- looks pretty cool.
return {
    'cshuaimin/ssr.nvim',
    lazy = true,
    keys = {
        '<Leader>sr',
    },
}
