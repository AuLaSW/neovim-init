" Austin's init.vim file
" set up 11-6-21


" SET ============================= 

" DO NOT TURN ON, WILL MESS UP LSP AND CMP
" turn on syntax highlighting
"syntax on

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

"set comments-=://
"set comments+=f://


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

" For emacs Org-mode in Neovim
Plug 'nvim-orgmode/orgmode'

" For table support (great for org-mode)
Plug 'dhruvasagar/vim-table-mode'

" autocomplete plugin requirements
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

" NERDTree for navigating directories in file
Plug 'preservim/nerdtree'

" Syntax highlighting in NERDTree
Plug 'scrooloose/nerdtree-project-plugin'

" Visual Selection file operations (over multiple files)
Plug 'PhilRunninger/nerdtree-visual-selection'

" git flags for files and folders in NERDTree
Plug 'Xuyuanp/nerdtree-git-plugin'

" nighlight open files and close buffer from NERDTree
Plug 'PhilRunninger/nerdtree-buffer-ops'

call plug#end()

" nvim-lspconfing SETTINGS ==============================

lua << EOF
require ('lspconfig').clangd.setup{}
EOF

" nvim-treesitter SETTING ==============================

" See orgmode settings

" Gruvbox SETTINGS ==============================

" color scheme settings to only the best
colorscheme gruvbox
set background=dark

" orgmode SETTINGS ==============================

lua << EOF
local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.org = {
  install_info = {
    url = 'https://github.com/milisims/tree-sitter-org',
    revision = 'main',
    files = {'src/parser.c', 'src/scanner.cc'},
  },
  filetype = 'org',
}

require'nvim-treesitter.configs'.setup {
  ensure_installed = {'cpp', 'vim', 'lua', 'org'}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
  -- If TS highlights are not enabled at all, or disabled via `disable` prop, highlighting will fallback to default Vim syntax highlighting
  highlight = {
    enable = true,
    disable = {'org'}, -- Remove this to use TS highlighter for some of the highlights (Experimental)
    additional_vim_regex_highlighting = {'org'}, -- Required since TS highlighter doesn't support all syntax features (conceal)
  },
  -- ensure_installed = {'org'}, -- Or run :TSUpdate org

  require('orgmode').setup({
    org_agenda_file = '/org/agenda/*',
    org_default_notes_file = '/org/notes/refile.org',
    org_indent_mode = 'noindent',
    org_agenda_templates = {
        N = {description = 'Narrative Note', template = '* TODO %^{Enter a quick description of the note} :note:narrative:\n%T\n%a\n\n%x\n\n%?' , target = '/org/notes/refile.org'},
        t = {description = 'Task', template = '* TODO %?\n %u'},
        C = {description = 'Character', template = '* TODO Add %^{Enter Character Name} to character log :character:\n%T\n%a\n\n%?', target = '/org/notes/refile.org'},
        p = {description = 'Poem', template = '* TODO Refile Poem %T :poetry:\nCREATED: %T\n\n%?', target = '/org/notes/poetry.org'}
        }
    } )
}
EOF

" nvim-cmp SETTINGS ==============================

lua <<EOF
  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        -- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
      end,
    },
    mapping = {
      ['<tab>'] = cmp.mapping.confirm({ select = true }),
      ['<C-J>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
      ['<C-K>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
      ['<Down>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
      ['<Up>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<C-L>'] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
      })
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    }, {
      { name = 'orgmode'},
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require('lspconfig')['clangd'].setup {
    capabilities = capabilities
  }
EOF

" =============== REMAPS ===============

" GENERAL ==============================

" change mapleader to <SPACE>
let mapleader = ","

" creates new lines below
nnoremap <Leader>o o<ESC>

" creates 2 new lines above
nnoremap <Leader>O O<ESC>

" create main C++ program function @ line
noremap <Leader>c iint main()<CR>{<CR>}<ESC>O

" create main C++ program function below line
noremap <Leader>C oint main()<CR>{<CR>}<ESC>O

" vim-table-mode ==============================

noremap <Leader>tm :TableModeToggle

" orgmode ==============================

" fix checkbox toggle mapping
noremap <Leader>oct :lua require("orgmode").action("org_mappings.toggle_checkbox")<CR>

" telescope ==============================

" live_grep search current directory
nnoremap <silent> <Leader>tsgd :lua require('telescope.builtin').live_grep()<CR>

" searches for string underneath cursor in current directory
nnoremap <silent> <Leader>tsgsd :lua require('telescope.builtin').grep_string()<CR>

" search for files in current directory
nnoremap <silent> <Leader>tsfd :lua require('telescope.builtin').file_browser()<CR>

" search in current buffer
nnoremap <silent> <Leader>tsfzb :lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>

" spelling suggesting
nnoremap <silent> <Leader>tssp :lua require('telescope.builtin').spell_suggest()<CR>




" DEPRICATED ==============================

" Autoinput '#include <>' in a file
" nnoremap <Leader>i i#include <><ESC>
" nnoremap <Leader>I i#include <><cr><ESC>

" remaps the <Up> key to <C-K> when in popupmenu
"imap <expr> <C-K> pumvisible() ? '<C-P>' : '<Up>'

" remaps the <Down> key to <C-J> when in popupmenu
"imap <expr> <C-J> pumvisible() ? '<C-N>' : '<Down>'

