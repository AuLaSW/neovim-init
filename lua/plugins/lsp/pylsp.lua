local M = {}

M.run = function (T)
    T.lsp.pylsp.setup({
        capabilities = T.capabilities,
        on_attach = on_attach,
        settings = {
            pylsp = {
                plugins = {
                    autopep8 = {
                        enabled = true,
                    },
                    pylsp_mypy = {
                        enabled = true,
                        live_mode = true,
                        report_progress = true,
                    },
                    pyflakes = {
                        enabled = false,
                    },
                    flake8 = {
                        enabled = true,
                    },
                    pylint = {
                        enabled = true,
                        executable = 'pylint',
                        args = { '--rcfile=' .. vim.fn.getcwd() .. '\\.config\\.pylintrc' }
                    },
                    rope = {
                        enabled = true,
                    }
                }
            }
        },
    })

end

return M

