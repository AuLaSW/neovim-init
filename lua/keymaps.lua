local M = {}
M.wk = require('which-key')

--- setup plugin requirements

function M.setup()
    M.hop = require('hop')
    M.autocommit = require('autocommit')
    M.trouble = require('trouble')
    M.harpoon = {
        ui = require('harpoon.ui'),
        mark = require('harpoon.mark'),
        term = require('harpoon.term')
    }
    M.ssr = require('ssr')
    M.nvim_tree = require('nvim-tree.api')
    M.telescope = require('telescope')
    M.telescope_api = require('telescope.builtin')
    M.cmp = require('cmp')
    M.codewindow = require('codewindow')
    M.neotest = require('neotest')

    M.wk.add({
        {
            '<leader>h',
            group = "Hop",
            {
                '<leader>hw',
                function()
                    M.hop.hint_words()
                end,
                desc = "Hop to the beginning of words.",
                mode = { 'n', 'v' },
            },
            {
                '<leader>hc',
                function()
                    M.hop.hint_char2()
                end,
                desc = "Specify two characters and hop to all occurances.",
                mode = { 'n', 'v' },
            },
            {
                '<leader>hs',
                function()
                    M.hop.hint_lines_skip_whitespace()
                end,
                desc = "Hop to the beginning of a line.",
                mode = { 'n', 'v' },
            },
        },
        {
            '<leader>f',
            group = "Harpoon",
            {
                '<leader>fr',
                function()
                    M.harpoon.ui.toggle_quick_menu()
                end,
                desc = "Activate the menu for harpoon.",
            },
            {
                '<leader>fo',
                function()
                    local buf = tonumber(vim.fn.input('Mark: '))
                    M.harpoon.ui.nav_file(buf)
                end,
                desc = "Move to the marked file at the numbered location.",
            },
            {
                '<leader>fn',
                function()
                    M.harpoon.ui.nav_next()
                end,
                desc = "Move to the next mark in the harpoon.",
            },
            {
                '<leader>fp',
                function()
                    M.harpoon.ui.nav_prev()
                end,
                desc = "Move to the next mark in the harpoon.",
            },
            {
                '<leader>fa',
                function()
                    M.harpoon.mark.add_file()
                end,
                desc = "Add the file to the harpoon.",
            },
        },
        {
            group = "Testing",
            {
                '<leader>e',
                group = "neotest"
            },
            {
                '<leader>ef',
                function()
                    M.neotest.run.run(vim.fn.expand("%"))
                end,
                desc = "Add the file to the harpoon."
            },
        },
        {
            '<leader>ac',
            function()
                M.autocommit.hook()
            end,
            desc = "Set saving commit hook for current buffer.",
            group = "Autocommit"
        },
        {
            '<leader>x',
            group = "Trouble",
            {
                '<leader>xx',
                "<cmd>Trouble diagnostics toggle<cr>",
                desc = "Toggle diagnostics"
            },
            {
                '<leader>xX',
                "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
                desc = "Toggle diagnostics for buffer"
            },
            {
                '<leader>xq',
                "<cmd> Trouble quickfix toggle<cr>",
                desc = "Toggle diagnostics quickfix"
            },
            {
                '<leader>xll',
                "<cmd>Trouble loclist toggle<cr>",
                desc = "Toggle diagnostics loclist"
            },
            {
                '<leader>xls',
                "<cmd>Trouble lsp toggle<cr>",
                desc = "Toggle diagnostics lsp"
            },
            {
                '<leader>xs',
                "<cmd>Trouble symbols toggle win.position=bottom<cr>",
                desc = "Toggle diagnostics lsp"
            },
        },
        {
            '<leader>sr',
            function()
                M.ssr.open()
            end,
            desc = "Use SSR to replace text.",
            mode = { 'n', 'v' },
            group = "SSR",
        },
        {
            '<leader>n',
            group = "Nvim Tree",
            {
                '<leader>nf',
                function()
                    M.nvim_tree.tree.focus()
                end,
                desc = "Focus on the file tree.",
                silent = true,
                noremap = true,
            },
            {
                '<leader>nr',
                function()
                    M.nvim_tree.tree.reload()
                end,
                desc = "Reload the file tree.",
                silent = true,
                noremap = true,
            },
            {
                '<leader>nb',
                function()
                    M.nvim_tree.tree.change_root(
                        vim.fn.expand('%:p:h')
                    )
                end,
                desc = "Change the root of the file tree.",
                silent = true,
                noremap = true,
            },
            {
                '<leader>ni',
                function()
                    vim.cmd('e $MYVIMRC')
                    vim.api.nvim_set_current_dir(vim.fn.expand('%:p:h'))
                end,
                desc = "Edit the nvim config file",
                silent = true,
                noremap = true,
            },
            {
                '<C-N>',
                function()
                    M.nvim_tree.tree.toggle()
                end,
                desc = "Toggle the file tree",
                silent = true,
                noremap = true,
            },
        },
        {
            '<leader>l',
            group = "lsp",
            {
                '<leader>lf',
                function()
                    vim.diagnostic.open_float()
                end,
                desc = "Display floating diagnostic.",
                silent = true,
                noremap = true,
            },
            {
                '<leader>lq',
                function()
                    vim.diagnostic.setloclist()
                end,
                desc = "Display lsp diagnostics in loclist.",
                silent = true,
                noremap = true,
            },
            {
                '<leader>ld',
                function()
                    vim.lsp.buf.type_definition()
                end,
                desc = "Display type definition.",
                silent = true,
                noremap = true,
            },
            {
                '<leader>lr',
                function()
                    vim.lsp.buf.references()
                end,
                desc = "List all references",
                silent = true,
                noremap = true,
            },
            {
                '<leader>lk',
                function()
                    vim.lsp.buf.hover()
                end,
                desc = "Show hover details",
                silent = true,
                noremap = true,
            },
            {
                '<leader>lK',
                function()
                    vim.lsp.buf.signature_help()
                end,
                desc = "Show function signature information",
                silent = true,
                noremap = true,
            },
            {
                '<leader>la',
                group = "lsp-actions",
                {
                    '<leader>lar',
                    function()
                        vim.lsp.buf.rename()
                    end,
                    desc = "Rename the element under the cursor",
                    silent = true,
                    noremap = true,
                },
                {
                    '<leader>lac',
                    function()
                        vim.lsp.buf.code_action()
                    end,
                    desc = "Perform a code action under the cursor",
                    silent = true,
                    noremap = true,
                },
                {
                    '<leader>laf',
                    function()
                        pcall(vim.lsp.buf.format)
                    end,
                    desc = "Format the file if the option is available.",
                    silent = true,
                    noremap = true,
                },
            },
            {
                '<leader>lg',
                group = "lsp-go-to",
                {
                    '<leader>lgD',
                    function()
                        vim.lsp.buf.declaration()
                    end,
                    desc = "Go to symbol declaration.",
                    silent = true,
                    noremap = true,
                },
                {
                    '<leader>lgd',
                    function()
                        vim.lsp.buf.definition()
                    end,
                    desc = "Go to symbol definition.",
                    silent = true,
                    noremap = true,
                },
                {
                    '<leader>lgim',
                    function()
                        vim.lsp.buf.implementation()
                    end,
                    desc = "List implementations in the loc list",
                    silent = true,
                    noremap = true,
                },
                {
                    '<leader>lgr',
                    function()
                        vim.lsp.buf.references()
                    end,
                    desc = "List references in the loc list",
                    silent = true,
                    noremap = true,
                },
                {
                    '<leader>lgoc',
                    function()
                        vim.lsp.buf.outgoing_calls()
                    end,
                    desc = "List outgoing calls in the loc list",
                    silent = true,
                    noremap = true,
                },
                {
                    '<leader>lgic',
                    function()
                        vim.lsp.buf.incoming_calls()
                    end,
                    desc = "List incoming calls in the loc list",
                    silent = true,
                    noremap = true,
                },
            },
        },
        {
            '<leader>t',
            group = "telescope",
            {
                '<leader>tp',
                function()
                    M.telescope.extensions.projects.projects({})
                end,
                desc = "Search recent projects",
                silent = true,
                noremap = true,
            },
            {
                '<leader>tl',
                function()
                    M.telescope_api.live_grep()
                end,
                desc = "Live grep search, obey .gitignore",
                silent = true,
                noremap = true,
            },
            {
                '<leader>tg',
                function()
                    M.telescope_api.grep_string()
                end,
                desc = "Grep search",
                silent = true,
                noremap = true,
            },
            {
                '<leader>tf',
                function()
                    M.telescope_api.find_files()
                end,
                desc = "Search files in current directory",
                silent = true,
                noremap = true,
            },
            {
                '<leader>tt',
                function()
                    M.telescope_api.treesitter()
                end,
                desc = "Search treesitter objects",
                silent = true,
                noremap = true,
            },
            {
                '<leader>tc',
                function()
                    M.telescope_api.current_buffer_fuzzy_find()
                end,
                desc = "Live fuzzy search in current buffer",
                silent = true,
                noremap = true,
            },
            {
                '<leader>tb',
                function()
                    M.telescope_api.buffers()
                end,
                desc = "Search list of buffers",
                silent = true,
                noremap = true,
            },
            {
                '<leader>t<leader>',
                function()
                    M.telescope_api.resume()
                end,
                desc = "Resume previous telescope search",
                silent = true,
                noremap = true,
            },
        },
        {
            group = "diagnostics",
            {
                '[d',
                function()
                    vim.diagnostic.goto_prev()
                end,
                desc = "Go to previous diagnostic",
                silent = true,
                noremap = true,
                mode = { 'n', 'v' },
            },
            {
                ']d',
                function()
                    vim.diagnostic.goto_next()
                end,
                desc = "Go to next diagnostic",
                silent = true,
                noremap = true,
                mode = { 'n', 'v' },
            },
        },
        {
            group = "cmp",
            {
                '<M-j>',
                function()
                    M.cmp.select_next_item({
                        behavior = M.cmp.SelectBehavior.Insert
                    })
                end,
                desc = "Select next suggestion",
                silent = true,
                noremap = true,
                mode = { 'i' },
            },
            {
                '<M-k>',
                function()
                    M.cmp.select_prev_item({
                        behavior = M.cmp.SelectBehavior.Insert
                    })
                end,
                desc = "Select previous suggestions",
                silent = true,
                noremap = true,
                mode = { 'i' },
            },
            {
                '<M-e>',
                function()
                    M.cmp.close()
                end,
                desc = "Close completion suggestions",
                silent = true,
                noremap = true,
                mode = { 'i' },
            },
            {
                '<M-i>',
                function()
                    M.cmp.confirm({
                        behavior = M.cmp.ConfirmBehavior.Replace,
                        select = true,
                    })
                end,
                desc = "Select completion",
                silent = true,
                noremap = true,
                mode = { 'i' },
            },
            {
                group = "ultisnips",
                {
                    '<M-.>',
                    function()
                        require("cmp_nvim_ultisnips.mappings").expand_or_jump_forwards()
                    end,
                    desc = "",
                    silent = true,
                    noremap = true,
                    mode = { 'i', 's', },
                },
                {
                    '<M-,>',
                    function()
                        require("cmp_nvim_ultisnips.mappings").expand_or_jump_forwards()
                    end,
                    desc = "",
                    silent = true,
                    noremap = true,
                    mode = { 'i', 's', },
                },
            },
        },
    })
end

return M
