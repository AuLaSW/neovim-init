-- Plugins
vim.cmd([[
    call plug#begin()

    " plugin for gruvbox colorscheme
    Plug 'luisiacc/gruvbox-baby', {'branch': 'main'}

    " plugin for seetting up lsp
    Plug 'neovim/nvim-lspconfig'

    " plugin for treesitter?
    Plug 'nvim-treesitter/nvim-treesitter' 

    " treesitter playground plugin
    Plug 'nvim-treesitter/playground'

    " Word counter plugin for manuscripts
    Plug 'vim-scripts/wc.vim--jcline'

    " telescope
    Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.3' }
    Plug 'nvim-telescope/telescope-file-browser.nvim'
    Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
    " This is needed for some of telescope's functionalities, especially searching
    " through files, but has to be downloaded onto the system, not through
    " neovim
    "'BurntSushi/ripgrep'

    " required plugin
    Plug 'nvim-lua/plenary.nvim'

    " For table support (great for org-mode)
    Plug 'dhruvasagar/vim-table-mode'

    " auto complete plugin requirements
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'SirVer/ultisnips'
    Plug 'quangnguyen30192/cmp-nvim-ultisnips'

    " preconfigured ultisnips
    Plug 'AuLaSW/vim-snippets', { 'branch': 'AuLaSW'}

    " working with latex
    Plug 'lervag/vimtex'


    " Installer for lsp's
    Plug 'williamboman/mason.nvim', { 'do': ':MasonUpdate' }
    Plug 'williamboman/mason-lspconfig.nvim'
    Plug 'neovim/nvim-lspconfig'

    " latex, markdown lsp
    Plug 'barreiroleo/ltex_extra.nvim'

    " Java lsp
    Plug 'mfussenegger/nvim-jdtls'
    Plug 'georgewfraser/java-language-server'

    " File tree
    Plug 'kyazdani42/nvim-web-devicons' 
    Plug 'kyazdani42/nvim-tree.lua'

    " Comment Plugin
    Plug 'numToStr/Comment.nvim', { 'tag': 'v0.6' }

    " LSP error handler
    Plug 'folke/trouble.nvim'

    " Git handler
    "Plug 'TimUntersberger/neogit'
    Plug 'tpope/vim-fugitive'
    Plug 'sindrets/diffview.nvim'

    " test Manger
    Plug 'vim-test/vim-test'

    " Popup Terminal
    Plug 'voldikss/vim-floaterm'

    " For future testing
    " Plug 'iamcco/markdown-preview.nvim'
    " Plug 'mzlogin/vim-markdown-toc'

    " debugging
    Plug 'puremourning/vimspector'
    "Plug 'mfussenegger/nvim-dap'
    "Plug 'rcarriga/cmp-dap'
    "Plug 'Pocco81/dap-buddy.nvim'

    " CSS utlsnips
    Plug 'rstacruz/vim-hyperstyle'


    call plug#end()
]])
