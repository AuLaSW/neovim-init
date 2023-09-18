vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require('nvim-tree').setup({
    renderer = {
        icons = {
            glyphs = {
                default = '',
                symlink = '',
                modified = '*',
                folder = {
                    default = '',
                    arrow_closed = "\\",
                    arrow_open = ">",
                    open = "",
                    empty = "",
                },
                git = {
                    unstaged = "us",
                    staged = "s",
                    unmerged = "um",
                    renamed = "r",
                    untracked = "ut",
                    deleted = "d",
                    ignored = "i",
                }
            },
            show = {
                git = true,
                file = false,
            },
        }
    }
})

--[[
require ('nvim-web-devicons').setup({
    default = true;
})

vim.g.nvim_tree_show_icons = {
    git = 0,
    folders = 0,
    files = 0,
    folder_arrows = 0,
}
--]]

