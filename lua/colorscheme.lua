local M = {}

local function colorscheme()
    local name = "gruvbox-baby"
    vim.cmd("colorscheme "..name)
end

local function highlights()
    vim.cmd([[
        hi DiagnosticUnderlineInfo guifg=#7fa2ac cterm=underline gui=underline
    ]])
    vim.api.nvim_set_hl(0, "@test_highlight", {fg = "#db34eb"})
end

function M.setup()
    colorscheme()
    highlights()
end

return M
