return {
    'kyazdani42/nvim-tree.lua',
    dependencies = {
        'ahmedkhalf/project.nvim',
    },
    lazy = true,
    cmd = {'NvimTreeOpen'},
    keys = {'<C-n>', '<Leader>ni'},
    enabled = true,
    opts = {
        sync_root_with_cwd = false,
        view = {
            preserve_window_proportions = true,
            float = {
                enable = true,
                quit_on_focus_loss = true,
                open_win_config = {
                    width = 50,
                    height = 50,
                }
            }
        },
        --- respect_buf_cwd = true,
        --- update_focused_file = {
        ---     enable = true,
        ---     update_root = true,
        --- },
        renderer = {
            highlight_opened_files = "name",
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
                    --- git = {
                    ---     unstaged = "us",
                    ---     staged = "s",
                    ---     unmerged = "um",
                    ---     renamed = "r",
                    ---     untracked = "ut",
                    ---     deleted = "d",
                    ---     ignored = "i",
                    --- }
                },
                show = {
                    git = true,
                    file = true,
                },
            }
        },
    },
    config = function(_, opts)
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1
        require('nvim-tree').setup(opts)
    end,
}
