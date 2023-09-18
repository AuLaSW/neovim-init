local M = {}

local function colorscheme()
    local name = "gruvbox-baby"
    vim.cmd("colorscheme "..name)
end

local function highlights()
    vim.cmd([[
        hi DiagnosticUnderlineInfo guifg=#7fa2ac cterm=underline gui=underline
    ]])
end

function M.setup()
    colorscheme()
    highlights()
end

return M
