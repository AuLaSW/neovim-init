local M = {}

function config_setup()
    require('nvim-treesitter.configs').setup {
        ensure_installed = {'markdown', 'vim', 'lua', 'cpp', 'c_sharp', 'java', 'cmake', 'css', 'html', 'python', 'go', 'javascript', 'typescript', 'vue', 'yaml'}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
        sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
        auto_install = true,
        highlight = {
            enable = true,
        },
        indent = {
            enable = true,
            disable = {'yaml', 'markdown'},
        },
    }
end

function language_register()
    vim.treesitter.language.register("markdown", {"book", "md"})
end

function M.setup()
    config_setup()
    language_register()
end

return M
