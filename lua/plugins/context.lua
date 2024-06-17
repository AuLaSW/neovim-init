return {
    'nvim-treesitter/nvim-treesitter-context',
    lazy = true,
    event = { 'BufReadPre', 'BufNewfile' },
    config = function()
        require("treesitter-context").setup({
            separator = '='
        })

        vim.cmd("hi TreesitterContextLineNumber guifg=#7fa2ac")
        vim.cmd("hi TreesitterContextSeparator guifg=#7fa2ac")

        vim.keymap.set("n", "[c", function()
            require("treesitter-context").go_to_context(vim.v.count1)
        end, { silent = true })
    end
}
