" Austin's _vimrc file
" set up 11-6-21


" SET ============================= 

" turn on syntax highlighting
syntax on

" exrc: run local vimrc file
set exrc

" turn on line numbers & use relative line numbers
" displays current line # & other lines as relative
" to current line
set nu rnu

" when searching is complete, do not leave highlights
set nohlsearch

" buffers that are abandoned are not discarded but hidden
set hidden

" Do not make noise when errors are made
set noerrorbells


" Tabs =====


" tabstop: # of spaces per tab
set tabstop=4 

" set shiftwidth (value for autoindent) to match tabstop
set shiftwidth=0

" set softtabstop to match tabstop 
set softtabstop=-1

" set shiftwidth (value for autoindent) to match tabstop
set shiftwidth=0

" all tabs are converted to spaces
set expandtab

" When moving the cursor up or down just after inserting indent for
" 'autoindent', do not delete the indent (added to defauts)
set cpoptions+=I


" End Tabs =====


" do not wrap text
" move this to different filetype plugin when set up
set nowrap

" do not create swap files. they are seemingly unneccessary
set noswapfile

" do not create a backup file when saving a file
set nobackup

" an undo directory. need to create!
" set undodir=./.vim/undodir

" create undo files
set undofile

" incrementally search as you type
set incsearch

" use Vim colorscheme in terminal
set termguicolors

" minumum # of lines displayed below or above cursor
set scrolloff=8

" not certain what this does, will need to look it up
set noshowmode

" menu options, see help for more info
set completeopt=menuone,noinsert,noselect

" show where 80 spaces are
set colorcolumn=80

" allow column for signals (errors, diagnostic, etc)
set signcolumn=yes

" use g++ as the make compiler
set mp=g++

set comments-=://
set comments+=f://


" =============== Plugins ===============

call plug#begin()

" plugin for gruvbox colorscheme
Plug 'gruvbox-community/gruvbox'

" undotree plugin. Uncertain what it does
" Plug 'mbbill/undotree'

" plugin for seetting up lsp
Plug 'neovim/nvim-lspconfig'

" plugin for treesitter?
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" treesitter playground plugin
Plug 'nvim-treesitter/playground'

" Word counter plugin for manuscripts
Plug 'vim-scripts/wc.vim--jcline'

" Telescope plugin for advanced fuzzy-search
Plug 'nvim-telescope/telescope.nvim'

" telescope dependencies:
" grep
" Plug 'BurntSushi/ripgrep'

" a search plugin for telescope
Plug 'nvim-telescope/telescope-fzf-native.nvim', {'do': 'make'}

" required plugin
Plug 'nvim-lua/plenary.nvim'

call plug#end()

" nvim-lspconfing SETTINGS ==============================

lua << EOF
require ('lspconfig').clangd.setup{}
EOF

" nvim-treesitter SETTING ==============================

lua << EOF
require 'nvim-treesitter.configs'.setup{
   highlight = {
       enable = true,
       additional_vim_regex_highlighting = false
   },
   indent = {
       enable = true
   }
}
EOF

" Gruvbox SETTINGS ===========================

" color scheme settings to only the best
colorscheme gruvbox
set background=dark


" =============== REMAPS ===============

" change mapleader to <SPACE>
let mapleader = " "

" creates new lines below
noremap <Leader>o o<ESC>

" creates 2 new lines above
noremap <Leader>O O<ESC>

" create main C++ program function @ line
noremap <Leader>c iint main()<CR>{<CR>}<ESC>O

" create main C++ program function below line
noremap <Leader>C oint main()<CR>{<CR>}<ESC>O

" Autoinput '#include <>' in a file
" nnoremap <Leader>i i#include <><ESC>
" nnoremap <Leader>I i#include <><cr><ESC>

" remaps the <Up> key to <C-K> when in popupmenu
imap <expr> <C-K> pumvisible() ? '<C-P>' : '<Up>'

" remaps the <Down> key to <C-J> when in popupmenu
imap <expr> <C-J> pumvisible() ? '<C-N>' : '<Down>'

