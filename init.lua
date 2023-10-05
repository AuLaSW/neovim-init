-- Init file for Austin Swanlaw
-- Set up 9-14-2023


require('lazy_loader')

require('setup').setup()

require('autocmd')

--[[
require('utils.keymaps').setup({
    use = {
        lsp = nil,
        jdtls = nil,
        telescope = nil,
        trouble = nil,
        projects = nil,
    }
})
require('trouble').setup( {
    icons = false,
    fold_open = "v", -- icon used for open folds
    fold_closed = ">", -- icon used for closed folds
    signs = {
        -- icons / text used for a diagnostic
        error = "",
        warning = "",
        hint = "",
        information = ""
    },
    use_diagnostic_signs = true
})
--]]
