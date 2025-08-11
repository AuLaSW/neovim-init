vim.g.tabby_inline_completion_trigger = 'manual'
vim.g.tabby_inline_completion_keybinding_accept = '<M-.>'
vim.g.tabby_inline_completion_keybinding_trigger_or_dismiss = '<M-\'>'

return {
    'TabbyMl/vim-tabby',
    lazy = true,
    event = 'BufEnter',
}
