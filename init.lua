-- Init file for Austin Swanlaw
-- Set up 9-14-2023


--require('old_plugins')

-- download lazy.nvim if it is not installed already
--require('remaps').setup()

require('lazy_loader')

require('setup').setup()

require('autocmd')

--[[
require('colorscheme').setup()

require('nvim_tree')

require('Comment').setup()

require('comment_nvim')

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

-- I would like to turn this into something I can pass all of the different LSPs
-- with
require('lsp_settings').setup()

require('treesitter_setup').setup()

require('cmp_setup').setup()

require('telescope_setup')

require('projectnvim')


require('bullet_vim')

--]]
