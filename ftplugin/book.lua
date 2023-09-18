local bufnr = vim.api.nvim_get_current_buf()
vim.bo[bufnr].textwidth = 65
vim.bo[bufnr].formatoptions = vim.bo.formatoptions .. 'a'

-- set the colorcolumn to be 5 characters within the textwidth
vim.opt.colorcolumn = '-5'

vim.cmd("echo 'Book Filetype Detected.'")

