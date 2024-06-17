vim.g.tabby_keybinding_accept = '<M-;>'
vim.g.tabby_keybinding_trigger_or_dismiss = '<M-\'>'
vim.g.tabby_trigger_mode = 'manual'

return {
    'TabbyMl/vim-tabby',
    lazy = true,
    event = 'BufEnter',
}
