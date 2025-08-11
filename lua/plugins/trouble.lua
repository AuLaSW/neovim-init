return {
    'folke/trouble.nvim',
    lazy = true,
    --event = {'VeryLazy'},
    keys = {
        "<Leader>xx",
        "<Leader>xw",
        "<Leader>xd",
        "<Leader>xq",
        "<Leader>xl",
        "gR",
    },
    opts = {
        modes = {
            funcs = {
                desc = "document symbols: functions",
                mode = "lsp_document_symbols",
                win = {
                    type = "split",
                    position = "right",
                    size = 60,
                },
                filter = {
                    buf = 0,
                    any = {
                        kind = {
                            "Method",
                            "Constructor",
                            "Function",
                            "Interface",
                            "Trait",
                        }
                    }
                }
            },
            vars = {
                desc = "document symbols: variables",
                mode = "lsp_document_symbols",
                win = {
                    type = "split",
                    position = "right",
                    size = 60,
                },
                filter = {
                    buf = 0,
                    any = {
                        kind = {
                            "Class",
                            "Struct",
                        }
                    }
                }
            }
        },
        fold_open = "v", -- icon used for open folds
        fold_closed = ">", -- icon used for closed folds
        use_diagnostic_signs = true,
        open_no_results = true,
        win = {
            type = "split",
            relative = "editor",
            position = "right"
        },
    },
    config = function (_, opts)
        require('trouble').setup(opts)
    end
}
