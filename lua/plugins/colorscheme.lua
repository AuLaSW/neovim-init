local function highlights(mod)
    vim.cmd([[
        hi DiagnosticUnderlineInfo guifg=#7fa2ac cterm=underline gui=underline
    ]])

   -- local colors = require("gruvbox-baby.colors").config()
    vim.api.nvim_set_hl(0, "@chapter.begin", {fg = "#458588"})
    vim.api.nvim_set_hl(0, "@chapter.end", {fg = "#b16286"})
    vim.api.nvim_set_hl(0, "@import.id", {fg = mod.pink})
    vim.api.nvim_set_hl(0, "@import.alias.old", {fg = mod.pink})
    vim.api.nvim_set_hl(0, "@import.alias.new", {fg = mod.dark_gray})
    vim.api.nvim_set_hl(0, "@variable.python", {fg = mod.dark_gray})
    vim.api.nvim_set_hl(0, "@arguments.id", {fg = mod.magenta})
    vim.api.nvim_set_hl(0, "@parameters.id", {fg = mod.pink})
    vim.api.nvim_set_hl(0, "@parameters.type", {fg = mod.forest_green})
    vim.api.nvim_set_hl(0, "@punctuation.delimiter.gitignore", {fg = mod.forest_green})
    vim.api.nvim_set_hl(0, "@operator.gitignore", {fg = mod.orange})
    vim.api.nvim_set_hl(0, "@annotate", {bg = mod.orange})
end


return {
    'luisiacc/gruvbox-baby',
    branch = 'main',
    lazy = false,
    priority = 1000,
    config = function(...)
        vim.cmd[[colorscheme gruvbox-baby]]

        local mod = require("gruvbox-baby.colors").config()
        highlights(mod)
    end,
}
