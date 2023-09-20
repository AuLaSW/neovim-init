vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require('nvim-tree').setup({
    sync_root_with_cwd = true,
    respect_buf_cwd = true,
    update_focused_file = {
        enable = true,
        update_root = true,
    },
    git = {
        timeout = 2000,
    },
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
