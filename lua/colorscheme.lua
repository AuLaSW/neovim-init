local M = {}

local function colorscheme()
    local name = "gruvbox-baby"
    vim.cmd("colorscheme "..name)
end

local function highlights()
    vim.cmd([[
        hi DiagnosticUnderlineInfo guifg=#7fa2ac cterm=underline gui=underline
    ]])

    local gruv_colors = require("gruvbox-baby.colors").config()
   -- local colors = require("gruvbox-baby.colors").config()
    vim.api.nvim_set_hl(0, "@chapter.begin", {fg = "#458588"})
    vim.api.nvim_set_hl(0, "@chapter.end", {fg = "#b16286"})
    vim.api.nvim_set_hl(0, "@import.id", {fg = gruv_colors.pink})
    vim.api.nvim_set_hl(0, "@import.alias.old", {fg = gruv_colors.pink})
    vim.api.nvim_set_hl(0, "@import.alias.new", {fg = gruv_colors.dark_gray})
    vim.api.nvim_set_hl(0, "@variable.python", {fg = gruv_colors.dark_gray})
    vim.api.nvim_set_hl(0, "@arguments.id", {fg = gruv_colors.magenta})
    vim.api.nvim_set_hl(0, "@parameters.id", {fg = gruv_colors.pink})
    vim.api.nvim_set_hl(0, "@parameters.type", {fg = gruv_colors.forest_green})
    vim.api.nvim_set_hl(0, "@punctuation.delimiter.gitignore", {fg = gruv_colors.forest_green})
    vim.api.nvim_set_hl(0, "@operator.gitignore", {fg = gruv_colors.orange})
    vim.api.nvim_set_hl(0, "@annotate", {bg = gruv_colors.orange})
end

function M.setup()
    colorscheme()
    highlights()
end

return M
