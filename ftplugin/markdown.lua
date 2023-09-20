local bufnr = vim.api.nvim_get_current_buf()
vim.bo[bufnr].textwidth = 65
vim.bo[bufnr].formatoptions = vim.bo.formatoptions .. 'a'
