local bufnr = vim.api.nvim_get_current_buf()
vim.bo[bufnr].textwidth = 65
vim.bo[bufnr].formatoptions = vim.bo.formatoptions .. 'aw12ptcn'

function bullet_vim_maps()
    local opts_1 = { buffer = bufnr, silent = true}
    local opts_2 = { buffer = bufnr, silent = true, noremap = true}

    vim.keymap.set('i', '<cr>', '<Plug>(bullets-newline)', opts_1)
    vim.keymap.set('i', '<C-cr>', '<Plug>(bullets-newline)', opts_2)
    vim.keymap.set('n', 'o', '<Plug>(bullets-newline)', opts_1)
    vim.keymap.set({'v', 'n'}, 'gN', '<Plug>(bullets-renumber)', opts_1)
    vim.keymap.set('n', '<Leader>x', '<Plug>(bullets-toggle-checkbox)', opts_1)
    vim.keymap.set('i', '<Tab>', '<Plug>(bullets-demote)', opts_1)
    vim.keymap.set('n', '>>', '<Plug>(bullets-demote)', opts_1)
    vim.keymap.set('v', '>', '<Plug>(bullets-demote)', opts_1)
    vim.keymap.set('i', '<S-Tab>', '<Plug>(bullets-promote)', opts_1)
    vim.keymap.set('n', '<<', '<Plug>(bullets-promote)', opts_1)
    vim.keymap.set('v', '<', '<Plug>(bullets-promote)', opts_1)
end

function remaps()
    local opts = { buffer = bufnr, silent = true, nowait = true}

    vim.keymap.set('i', '<Space><Space>', '.  ', opts)
end

bullet_vim_maps()
remaps()

vim.cmd("echo 'Markdown Filetype Detected.'")

