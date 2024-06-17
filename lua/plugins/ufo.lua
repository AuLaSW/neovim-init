return {
    'kevinhwang91/nvim-ufo',
    enabled = false,
    dependencies = {
        'kevinhwang91/promise-async'
    },
    config = function ()
        vim.o.foldcolumn = '1'
        vim.o.foldlevel = 200
        vim.o.foldlevelstart = 00
        vim.o.foldenable = true

        require('ufo').setup({
            provider_selector = function (bufnr, filetype, buftype)
                return {'treesitter', 'indent'}
            end
        })
    end
}
