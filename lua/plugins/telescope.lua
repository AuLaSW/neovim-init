return {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        'nvim-telescope/telescope-file-browser.nvim',
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
        },
        'BurntSushi/ripgrep',
        'sharkdp/fd',
        'nvim-treesitter/nvim-treesitter',
        'nvim-lua/plenary.nvim',
        'ahmedkhalf/project.nvim',
    },
    tag = '0.1.3',
    lazy = true,
    keys = {
        '<Leader>bf',
        '<Leader>cfz',
        '<Leader>fd',
    },
    config = function (...)
        require('telescope').load_extension('projects')
        local opts = { silent = true, noremap = true }

        local api = require('telescope.builtin')

        -- grep string you type in
        vim.keymap.set({ 'n', 'v' }, '<Leader>lg', function() api.live_grep() end, opts)
        -- grep selected string in files
        vim.keymap.set({ 'n', 'v' }, '<Leader>gs', function() api.grep_string() end, opts)
        -- search through file names
        vim.keymap.set({ 'n', 'v' }, '<Leader>fd', function() api.find_files() end, opts)
        -- view all queryable objects from treesitter
        vim.keymap.set({ 'n', 'v' }, '<Leader>ts', function() api.treesitter() end, opts)
        -- fuzzy find in the current buffer
        vim.keymap.set({ 'n', 'v' }, '<Leader>cfz', function() api.current_buffer_fuzzy_find() end, opts)
        -- list all open buffers
        vim.keymap.set({ 'n', 'v' }, '<Leader>bf', function() api.buffers() end, opts)
        -- resumes the previous telescope picker
        vim.keymap.set({ 'n', 'v' }, '<Leader><Leader>', function() api.resume() end, opts)
        -- list quickfix items and search through them
        vim.keymap.set({ 'n', 'v' }, '<Leader>tqf', function() api.quickfix() end, opts)
        -- list loclist items and search through them
        vim.keymap.set({ 'n', 'v' }, '<Leader>tl', function() api.loclist() end, opts)
        -- list keymaps and search through them
        vim.keymap.set({ 'n', 'v' }, '<Leader>tk', function() api.keymaps() end, opts)
        -- list diagnostics and search through them
        vim.keymap.set({ 'n', 'v' }, '<Leader>td', function() api.diagnostics() end, opts)

        -- GIT --
        -- fuzzy search for files tracked by git
        vim.keymap.set({ 'n', 'v' }, '<Leader>fg', function() api.git_files() end, opts)
        -- search git commits
        vim.keymap.set({ 'n', 'v' }, '<Leader>gc', function() api.git_commits() end, opts)
        -- search buffer's git commits
        vim.keymap.set({ 'n', 'v' }, '<Leader>gbc', function() api.git_bcommits() end, opts)
        -- search buffer's line's git commits
        vim.keymap.set({ 'n', 'v' }, '<Leader>gcr', function() api.git_bcommits_range() end, opts)
        -- search buffer's line's git commits
        vim.keymap.set({ 'n', 'v' }, '<Leader>gb', function() api.git_branches() end, opts)
    end
}
