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

    M.wk.register({
        -- hop/harpoon
        ["<leader>h"] = {
            name = "Hop/Harpoon",
            --- hop
            w = {
                function ()
                    M.hop.hint_words()
                end,
                "Hop to the beginning of words.",
                mode = {'n', 'v'}
            },
            c = {
                function ()
                    M.hop.hint_char2()
                end,
                "Specify two characters and hop to all occurances.",
                mode = {'n', 'v'}
            },
            s = {
                function ()
                    M.hop.hint_lines_skip_whitespace()
                end,
                "Hop to the beginning of a line.",
                mode = {'n', 'v'}
            },
            --- harpoon
            r = {
                function ()
                    M.harpoon.ui.toggle_quick_menu()
                end,
                "Activate the menu for harpoon."
            },
            o = {
                function ()
                    local buf = tonumber(vim.fn.input('Mark: '))
                    M.harpoon.ui.nav_file(buf)
                end,
                "Move to the marked file at the numbered location."
            },
            n = {
                function()
                    M.harpoon.ui.nav_next()
                end,
                "Move to the next mark in the harpoon."
            },
            p = {
                function()
                    M.harpoon.ui.nav_prev()
                end,
                "Move to the next mark in the harpoon."
            },
            a = {
                function()
                    M.harpoon.mark.add_file()
                end,
                "Add the file to the harpoon."
            },
            -- autocommit
            ['<leader>a'] = {
                c = {
                    function ()
                        M.autocommit.hook()
                    end,
                    "Set saving commit hook for current buffer."
                }
            },
        },
        --- trouble
        ['<leader>x'] = {
            name = "Trouble",
            x = {
                "<cmd>Trouble diagnostics toggle<cr>",
                "Toggle diagnostics"
            },
            X = {
                "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
                "Toggle diagnostics for buffer"
            },
            q = {
                "<cmd> Trouble quickfix toggle<cr>",
                "Toggle diagnostics quickfix"
            },
            l = {
                "<cmd>Trouble loclist toggle",
                "Toggle diagnostics loclist"
            },
            ls = {
                "<cmd>Trouble lsp toggle",
                "Toggle diagnostics lsp"
            },
        },
        --- ssr
        ['<leader>s'] = {
            name = "ssr",
            r = {
                function ()
                    M.ssr.open()
                end,
                "Use SSR to replace text.",
                mode = {'n', 'v'}
            }
        },
        --- nvim-tree
        ['<leader>n'] = {
            name = "nvim-tree",
            f = {
                function ()
                    M.nvim_tree.tree.focus()
                end,
                "Focus on the file tree.",
                silent = true,
                noremap = true,
            },
            r = {
                function ()
                    M.nvim_tree.tree.reload()
                end,
                "Reload the file tree.",
                silent = true,
                noremap = true,
            },
            b = {
                function ()
                    M.nvim_tree.tree.change_root(
                        vim.fn.expand('%:p:h')
                    )
                end,
                "Change the root of the file tree.",
                silent = true,
                noremap = true,
            },
            i = {
                function ()
                    vim.cmd('e $MYVIMRC')
                    vim.api.nvim_set_current_dir(vim.fn.expand('%:p:h'))
                end,
                "Edit the nvim config file",
                silent = true,
                noremap = true,
            },
        },
        -- nvim_tree init
        ["<C-N>"] = {
            function()
                M.nvim_tree.tree.toggle()
            end,
            "Toggle the file tree",
            silent = true,
            noremap = true,
        },
        --- lsp
        ['<leader>l'] = {
            name = "lsp",
            f = {
                function ()
                    vim.diagnostic.open_float()
                end,
                "Display floating diagnostic.",
                silent = true,
                noremap = true,
            },
            q = {
                function ()
                    vim.diagnostic.setloclist()
                end,
                "Display lsp diagnostics in loclist.",
                silent = true,
                noremap = true,
            },
            d = {
                function ()
                    vim.lsp.buf.type_definition()
                end,
                "Display type definition.",
                silent = true,
                noremap = true,
            },
            r = {
                function()
                    vim.lsp.buf.references()
                end,
                "List all references.",
                silent = true,
                noremap = true,
            },
            k = {
                function()
                    vim.lsp.buf.hover()
                end,
                "Show hover details.",
                silent = true,
                noremap = true,
            },
            K = {
                function ()
                    vim.lsp.buf.signature_help()
                end,
                "Show function signature information.",
                silent = true,
                noremap = true,
            },
            a = {
                name = "actions",
                r = {
                    function ()
                        vim.lsp.buf.rename()
                    end,
                    "Rename the element under the cursor.",
                    silent = true,
                    noremap = true,
                },
                c = {
                    function ()
                        vim.lsp.buf.code_action()
                    end,
                    "Perform a code action under the cursor.",
                    silent = true,
                    noremap = true,
                },
                f = {
                    function ()
                        if pcall(vim.lsp.buf.format) then
                            print('Formatting...')
                        else
                            print('No formatting available')
                        end
                    end,
                    "Perform formatting on the file if it's available.",
                    noremap = true,
                },
            },
        },
        --- go-to
        ['<leader>g'] = {
            name = "go-to",
            l = {
                name = "lsp",
                D = {
                    function()
                        vim.lsp.buf.declaration()
                    end,
                    "Go to the declaration.",
                    silent = true,
                    noremap = true,
                },
                d = {
                    function()
                        vim.lsp.buf.definition()
                    end,
                    "Go to the definition.",
                    silent = true,
                    noremap = true,
                },
                i = {
                    function ()
                        vim.lsp.buf.implementation()
                    end,
                    "Go to the implementation",
                    silent = true,
                    noremap = true,
                },
            }
        },
        ['<leader>t'] = {
            name = "telescope",
            p = {
                function()
                    M.telescope.extensions.projects.projects({})
                end,
                "Search recent projects",
                silent = true,
                noremap = true,
            },
            l = {
                function()
                    M.telescope_api.live_grep()
                end,
                "Live grep search, obey .gitignore",
                silent = true,
                noremap = true,
            },
            g = {
                function()
                    M.telescope_api.grep_string()
                end,
                "Grep search",
                silent = true,
                noremap = true,
            },
            f = {
                function()
                    M.telescope_api.find_files()
                end,
                "Search files in current directory",
                silent = true,
                noremap = true,
            },
            t = {
                function()
                    M.telescope_api.treesitter()
                end,
                "Search treesitter objects",
                silent = true,
                noremap = true,
            },
            c = {
                function()
                    M.telescope_api.current_buffer_fuzzy_find()
                end,
                "Live fuzzy search inside current buffer",
                silent = true,
                noremap = true,
            },
            b = {
                function()
                    M.telescope_api.buffers()
                end,
                "Search list of buffers",
                silent = true,
                noremap = true,
            },
            ['<leader>'] = {
                function()
                    M.telescope_api.resume()
                end,
                "Resume previous telescope search",
                silent = true,
                noremap = true,
            },
        },
        --- left motions
        ['['] = {
            name = "left motions",
            d = {
                function ()
                    vim.diagnostic.goto_prev()
                end,
                "Move to previous diagnostic.",
                silent = true,
                noremap = true,
                mode = {'n', 'v'},
            },
            --- nvim-treesitter-textobjects move keymaps
            --- start
            f = "which_key_ignore",
            F = "which_key_ignore",
            c = "which_key_ignore",
            l = "which_key_ignore",
            [']'] = "which_key_ignore",
            ['['] = "which_key_ignore",
            --- end
        },
        --- right motions
        [']'] = {
            name = "right motions",
            d = {
                function ()
                    vim.diagnostic.goto_next()
                end,
                "Move to next diagnostic.",
                silent = true,
                noremap = true,
                mode = {'n', 'v'},
            },
            --- nvim-treesitter-textobjects move keymaps
            --- start
            f = "which_key_ignore",
            F = "which_key_ignore",
            c = "which_key_ignore",
            l = "which_key_ignore",
            [']'] = "which_key_ignore",
            ['['] = "which_key_ignore",
            --- end
        },
        s = {
            --- nvim-treesitter-textobjects select keymaps
            --- start
            name = "which_key_ignore",
            af = "which_key_ignore",
            aF = "which_key_ignore",
            ['if'] = "which_key_ignore",
            aa = "which_key_ignore",
            ia = "which_key_ignore",
            la = "which_key_ignore",
            ra = "which_key_ignore",
            ab = "which_key_ignore",
            ib = "which_key_ignore",
            al = "which_key_ignore",
            il = "which_key_ignore",
            ac = "which_key_ignore",
            ic = "which_key_ignore",
            ['a['] = "which_key_ignore",
            ['i['] = "which_key_ignore",
            --- end

            --- nvim-treesitter-textobjects swap keymaps
            --- start
            w = {
                name = "which_key_ignore",
                p = "which_key_ignore",
                P = "which_key_ignore",

                f = "which_key_ignore",
                F = "which_key_ignore",

                b = "which_key_ignore",
                B = "which_key_ignore",
            },
            --- end
        },
        --- cmp mappings
        --- start
        ['<A-j>'] = {
            function ()
                M.cmp.select_next_item({
                    behavior = M.cmp.SelectBehavior.Insert
                })
            end,
            "Select next suggestion",
            mode = {'i'}
        },
        ['<M-k>'] = {
            function ()
                M.cmp.select_prev_item({
                    behavior = M.cmp.SelectBehavior.Insert
                })
            end,
            "Select previous suggestion",
            mode = {'i'}
        },
        ['<M-e>'] = {
            function ()
                M.cmp.close()
            end,
            "Close completion suggestions",
            mode = {'i'}
        },
        -- this is also a general competion usage keymap
        ['<M-;>'] = {
            function ()
                M.cmp.confirm({
                    behavior = M.cmp.ConfirmBehavior.Replace,
                    select = true,
                })
            end,
            "Select completion (cmp/Tabby)",
            mode = {'i'}
        },
        --- end
        ['<C-\\>'] = "Trigger or dismiss Tabby",
        -- tmux is using these
        ['<A-l>'] = "which_key_ignore",
        ['<A-h>'] = "which_key_ignore",
        ['<C-Space>'] = "which_key_ignore",
    })
end

return M
