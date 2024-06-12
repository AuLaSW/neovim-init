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
        sync_root_with_cwd = true,
        --- respect_buf_cwd = true,
        --- update_focused_file = {
        ---     enable = true,
        ---     update_root = true,
        --- },
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
    },
    config = function(_, opts)
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1
        require('nvim-tree').setup(opts)

        local api = require('nvim-tree.api')
        local key_opts = { silent = true, noremap = true }

        vim.keymap.set(
            { 'n', 'v' },
            '<C-n>',
            function()
                api.tree.toggle()
            end,
            key_opts
        )

        vim.keymap.set({ 'n', 'v' }, '<Leader>nf', function() api.tree.focus() end, key_opts)
        vim.keymap.set({ 'n', 'v' }, '<Leader>nr', function() api.tree.reload() end, key_opts)

        -- change the nvim-tree working directory to the directory of the current file
        vim.keymap.set({ 'n', 'v' }, '<Leader>nb', function() api.tree.change_root(vim.fn.expand('%:p:h')) end, key_opts)
        vim.keymap.set({ 'n', 'v' }, '<Leader>ni', function()
            vim.cmd('e $MYVIMRC')
            vim.api.nvim_set_current_dir(vim.fn.expand('%:p:h'))
        end, key_opts)
    end,
}
