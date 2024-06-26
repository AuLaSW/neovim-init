--This is the beginning of testing an init.lua config
local M = {}

function python()
    if vim.loop.os_uname().sysname == "Linux" then
        vim.g.python3_host_prog = '/usr/bin/python3.12'
    else
        vim.g.python3_host_prog = 'C:\\Users\\dafrp\\AppData\\Local\\Microsoft\\WindowsApps\\py.exe'
    end
end

local function basicOptions()
    --- exrc: run local vimrc file
    vim.opt.exrc = true

    vim.g.mapleader = ','

    --- turn on line numbers & use relative line numbers
    --- displays current line # & other lines as relative
    --- to current line
    vim.opt.nu = true
    vim.opt.rnu = true

    --- when searching is complete, do not leave highlights
    ---set nohlsearch
    vim.opt.hlsearch = false

    --- buffers that are abandoned are not discarded but hidden
    vim.opt.hidden = true

    --- Do not make noise when errors are made
    vim.opt.errorbells = false

    --- when it opens or creates a file, try unix and if that doesn't work,
    --- then try dos file format endings
    vim.opt.ffs = 'unix,dos'

    vim.opt.mouse = ''

    -- vim.opt.statusline = [[%<%f %h%m%r%=words: %{wordcount().words}%=line: %l  col: %c   %P]]
end

function tabSetup()
    -- number of spaces per tab
    vim.opt.tabstop = 4

    -- set the autoindent to match the tab stop
    vim.opt.shiftwidth = 0

    -- set soft tab stop to match the tabstop
    vim.opt.softtabstop = -1

    -- value of autoindent to match tabstop
    vim.opt.shiftwidth = 0

    -- convert tabs to spaces
    vim.opt.expandtab = true
end

function fileSetup()
    -- do not wrap text automatically
    vim.opt.wrap = false

    -- do not create swap files
    vim.opt.swapfile = false

    -- use undo files
    vim.opt.undofile = true

    -- performs incremental search when searching
    vim.opt.incsearch = true

    -- uses the coloscheme in terminal
    vim.opt.termguicolors = true

    -- minimum number of lines displayed below or above the cursor
    vim.opt.scrolloff = 8

    -- minimum number of lines displayed to the left or right of the cursor
    vim.opt.sidescrolloff = 17

    -- shows what mode you are in, INSERT, VISUAL, or others
    vim.opt.showmode = false

    -- menu options
    vim.opt.completeopt = 'menuone,noinsert,noselect'

    -- creats a column at # characters out
    vim.opt.colorcolumn = '80'

    -- allow column for diagnostic and error signlas
    vim.opt.signcolumn = 'yes'

    -- use g++ as the make compiler. This needs to be changed.
    --vim.opt.mp = 'g++'

    -- use spell check on all files
    vim.opt.spell = false
    --vim.opt.spellfile = vim.fn.stdpath('config') .. '/spell/en.utf-8.add'

    -- set spellchecking language
    vim.opt.spelllang = 'en_us'
end

function M.setup()
    python()
    basicOptions()
    tabSetup()
    fileSetup()

    --- local opts = { silent = true, noremap = true }
    --- vim.keymap.set('n', '<Leader>o', 'o<ESC>', opts)
    --- vim.keymap.set('n', '<Leader>O', 'O<ESC>', opts)
    ---
    --- -- for regenerating a sheet
    --- vim.keymap.set('n', '<Leader>pg', 'V{gq', opts)
    --- vim.keymap.set('n', '<Leader>pG', 'V}gq', opts)
    --- vim.keymap.set('n', '<Leader>pp', '{V}gq', opts)
end

return M
