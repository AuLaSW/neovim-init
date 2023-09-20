---@diagnostic disable: lowercase-global
local M = {}

local opts = { silent = true, noremap = true }

function leader()
    vim.g.mapleader = ","
end

function quality_of_life()
    vim.keymap.set('n', '<Leader>o', 'o<ESC>', opts)
    vim.keymap.set('n', '<Leader>O', 'O<ESC>', opts)

    -- for regenerating a sheet
    vim.keymap.set('n', '<Leader>gen', 'ggVGgq', opts)
end

function lsp_remaps()
    diagnostics = function()
        -- open float
        vim.keymap.set('n', '<space>e', function()
            vim.diagnostic.open_float()
        end, opts)
        -- set loclist
        vim.keymap.set('n', '<space>q', function() vim.diagnostic.setloclist() end, opts)

        -- go to previous
        vim.keymap.set('n', '[d', function() vim.diagnostic.goto_prev() end, opts)
        -- go to next
        vim.keymap.set('n', ']d', function() vim.diagnostic.goto_next() end, opts)
    end

    lsp_navigation = function()
        -- jumping --
        -- jump to symbol declaration
        vim.keymap.set('n', 'gD', function() vim.lsp.buf.declaration() end, opts)
        -- jump to symbol definition
        vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
        -- jump to type definition
        vim.keymap.set('n', '<leader>D', function() vim.lsp.buf.type_definition() end, opts)

        -- list jumping --
        -- list all implementations in quickfix window
        vim.keymap.set('n', 'gi', function() vim.lsp.buf.implementation() end, opts)
        -- list all references in quickfix window
        vim.keymap.set('n', 'gr', function() vim.lsp.buf.references() end, opts)
    end

    display = function()
        vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set('n', '<C-k>', function() vim.lsp.buf.signature_help() end, opts)
    end

    action = function() -- workspace --
        vim.keymap.set('n', '<leader>wa', function() vim.lsp.buf.add_workspace_folder() end, opts)
        vim.keymap.set('n', '<leader>wr', function() vim.lsp.buf.remove_workspace_folder() end, opts)
        vim.keymap.set('n', '<leader>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, opts)

        -- code --
        vim.keymap.set('n', '<leader>rn', function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set('n', '<leader>ca', function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.formatting() end, opts)
    end

    action()
    display()
    lsp_navigation()
    diagnostics()
end

function jdtls()
    local lsp = require('jdtls')

    vim.keymap.set('n', '<A-o>', function() lsp.organize_imports() end, opts)
    vim.keymap.set('n', '<Leader>crv', function() lsp.extract_variable() end, opts)
    vim.keymap.set('v', '<Leader>crv', function() lsp.extract_variable(true) end, opts)
    vim.keymap.set('n', '<Leader>crc', function() lsp.extract_constant() end, opts)
    --vim.keymap.set('v', '<Leader>crc', lsp.extract_constant(true), opts)
    --vim.keymap.set('v', '<Leader>crm', lsp.extract_method(true), opts)
end

function telescope()
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

function nvim_tree()
    local api = require('nvim-tree.api')

    vim.keymap.set({ 'n', 'v' }, '<C-n>', function() api.tree.toggle() end, opts)
    vim.keymap.set({ 'n', 'v' }, '<Leader>nf', function() api.tree.focus() end, opts)
    vim.keymap.set({ 'n', 'v' }, '<Leader>nr', function() api.tree.reload() end, opts)

    -- change the nvim-tree working directory to the directory of the current file
    vim.keymap.set({ 'n', 'v' }, '<Leader>nb', function() api.tree.change_root(vim.fn.expand('%:p:h')) end, opts)
    vim.keymap.set({ 'n', 'v' }, '<Leader>ni', function()
        vim.cmd('e $MYVIMRC')
        vim.api.nvim_set_current_dir(vim.fn.expand('%:p:h'))
    end, opts)
end

function trouble()
    local api = require('trouble')

    vim.keymap.set({ 'n', 'v' }, "<Leader>xx", function() api.open() end)
    vim.keymap.set({ 'n', 'v' }, "<Leader>xw", function() api.open("workspace_diagnostics") end)
    vim.keymap.set({ 'n', 'v' }, "<Leader>xd", function() api.open("document_diagnostics") end)
    vim.keymap.set({ 'n', 'v' }, "<Leader>xq", function() api.open("quickfix") end)
    vim.keymap.set({ 'n', 'v' }, "<Leader>xl", function() api.open("loclist") end)
    vim.keymap.set({ 'n', 'v' }, "gR", function() api.open("lsp_references") end)
end

function projects()
    --local api = require('projects_nvim')
    local tel = require('telescope')


    vim.keymap.set({ 'n', 'v' }, "<Leader>r", function() tel.extensions.projects.projects({}) end)
end

function M.setup()
    leader()
    quality_of_life()
    lsp_remaps()
    jdtls()
    telescope()
    nvim_tree()
    trouble()
    projects()
end

return M
