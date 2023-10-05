-- Plugins
vim.cmd([[
    call plug#begin()

    " preconfigured ultisnips
    Plug 'AuLaSW/vim-snippets', { 'branch': 'AuLaSW'}

    " test Manger
    Plug 'vim-test/vim-test'

    " Popup Terminal
    Plug 'voldikss/vim-floaterm'

    " For future testing
    " Plug 'iamcco/markdown-preview.nvim'
    " Plug 'mzlogin/vim-markdown-toc'

    " debugging
    Plug 'puremourning/vimspector'
    " CSS utlsnips
    Plug 'rstacruz/vim-hyperstyle'

    call plug#end()
]])
