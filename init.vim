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
Plug 'SirVer/ultisnips'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'

" working with latex
Plug 'lervag/vimtex'

" Zettelkasten notes manager
Plug 'renerocksai/telekasten.nvim'

" Calendar for zettelkasten
Plug 'renerocksai/calendar-vim'

" For future testing
" Plug 'iamcco/markdown-preview.nvim'
" Plug 'mzlogin/vim-markdown-toc'

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
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
      ['<C-J>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
      ['<C-K>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
      ['<Down>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
      ['<Up>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
      ['<C-D>'] = cmp.mapping.scroll_docs(-4),
      ['<C-F>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-E>'] = cmp.mapping.close(),
      ['<C-L>'] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
      })
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      -- { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      { name = 'ultisnips' }, -- For ultisnips users.
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

" vimtex ===============================

let g:tex_flavor = 'latex'
let g:vimtex_view_method = 'zathura'
let g:vimtex_quickfix_mode = 0
let conceallevel = 2

" telekasten ====================

lua << END
local home = "C:\Users\ferns\zettelkasten"
require('telekasten').setup({
    home         = home,

    -- if true, telekasten will be enabled when opening a note within the configured home
    take_over_my_home = true,

    -- auto-set telekasten filetype: if false, the telekasten filetype will not be used
    --                               and thus the telekasten syntax will not be loaded either
    auto_set_filetype = true,

    dailies      = home .. '/' .. 'daily',
    weeklies     = home .. '/' .. 'weekly',
    templates    = home .. '/' .. 'templates',

    -- image subdir for pasting
    -- subdir name
    -- or nil if pasted images shouldn't go into a special subdir
    image_subdir = "img",

    -- markdown file extension
    extension    = ".md",

    -- following a link to a non-existing note will create it
    follow_creates_nonexisting = true,
    dailies_create_nonexisting = true,
    weeklies_create_nonexisting = true,

    -- template for new notes (new_note, follow_link)
    -- set to `nil` or do not specify if you do not want a template
    template_new_note = home .. '/' .. 'templates/new_note.md',

    -- template for newly created daily notes (goto_today)
    -- set to `nil` or do not specify if you do not want a template
    template_new_daily = home .. '/' .. 'templates/daily.md',

    -- template for newly created weekly notes (goto_thisweek)
    -- set to `nil` or do not specify if you do not want a template
    template_new_weekly= home .. '/' .. 'templates/weekly.md',

    -- image link style
    -- wiki:     ![[image name]]
    -- markdown: ![](image_subdir/xxxxx.png)
    image_link_style = "markdown",

    -- integrate with calendar-vim
    plug_into_calendar = true,
    calendar_opts = {
        -- calendar week display mode: 1 .. 'WK01', 2 .. 'WK 1', 3 .. 'KW01', 4 .. 'KW 1', 5 .. '1'
        weeknm = 4,
        -- use monday as first day of week: 1 .. true, 0 .. false
        calendar_monday = 1,
        -- calendar mark: where to put mark for marked days: 'left', 'right', 'left-fit'
        calendar_mark = 'left-fit',
    },

    -- telescope actions behavior
    close_after_yanking = false,
    insert_after_inserting = true,

    -- tag notation: '#tag', ':tag:', 'yaml-bare'
    tag_notation = "#tag",

    -- command palette theme: dropdown (window) or ivy (bottom panel)
    command_palette_theme = "ivy",

    -- tag list theme:
    -- get_cursor: small tag list at cursor; ivy and dropdown like above
    show_tags_theme = "ivy",

    -- when linking to a note in subdir/, create a [[subdir/title]] link
    -- instead of a [[title only]] link
    subdirs_in_links = true,

    -- template_handling
    -- What to do when creating a new note via `new_note()` or `follow_link()`
    -- to a non-existing note
    -- - prefer_new_note: use `new_note` template
    -- - smart: if day or week is detected in title, use daily / weekly templates (default)
    -- - always_ask: always ask before creating a note
    template_handling = "smart",

    -- path handling:
    --   this applies to:
    --     - new_note()
    --     - new_templated_note()
    --     - follow_link() to non-existing note
    --
    --   it does NOT apply to:
    --     - goto_today()
    --     - goto_thisweek()
    --
    --   Valid options:
    --     - smart: put daily-looking notes in daily, weekly-looking ones in weekly,
    --              all other ones in home, except for notes/with/subdirs/in/title.
    --              (default)
    --
    --     - prefer_home: put all notes in home except for goto_today(), goto_thisweek()
    --                    except for notes with subdirs/in/title.
    --
    --     - same_as_current: put all new notes in the dir of the current note if
    --                        present or else in home
    --                        except for notes/with/subdirs/in/title.
    new_note_location = "smart",

})
END

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

" Zettelkasten ==============================

nnoremap <leader>zf :lua require('telekasten').find_notes()<CR>
nnoremap <leader>zd :lua require('telekasten').find_daily_notes()<CR>
nnoremap <leader>zg :lua require('telekasten').search_notes()<CR>
nnoremap <leader>zz :lua require('telekasten').follow_link()<CR>
nnoremap <leader>zT :lua require('telekasten').goto_today()<CR>
nnoremap <leader>zW :lua require('telekasten').goto_thisweek()<CR>
nnoremap <leader>zw :lua require('telekasten').find_weekly_notes()<CR>
nnoremap <leader>zn :lua require('telekasten').new_note()<CR>
nnoremap <leader>zN :lua require('telekasten').new_templated_note()<CR>
nnoremap <leader>zy :lua require('telekasten').yank_notelink()<CR>
nnoremap <leader>zc :lua require('telekasten').show_calendar()<CR>
nnoremap <leader>zC :CalendarT<CR>
nnoremap <leader>zi :lua require('telekasten').paste_img_and_link()<CR>
nnoremap <leader>zt :lua require('telekasten').toggle_todo()<CR>
nnoremap <leader>zb :lua require('telekasten').show_backlinks()<CR>
nnoremap <leader>zF :lua require('telekasten').find_friends()<CR>
nnoremap <leader>zI :lua require('telekasten').insert_img_link({ i=true })<CR>
nnoremap <leader>zp :lua require('telekasten').preview_img()<CR>
nnoremap <leader>zm :lua require('telekasten').browse_media()<CR>
nnoremap <leader>za :lua require('telekasten').show_tags()<CR>
nnoremap <leader># :lua require('telekasten').show_tags()<CR>

" on hesitation, bring up the panel
nnoremap <leader>z :lua require('telekasten').panel()<CR>

" we could define [[ in **insert mode** to call insert link
" inoremap [[ <cmd>:lua require('telekasten').insert_link()<CR>
" alternatively: leader [
inoremap <leader>[ <cmd>:lua require('telekasten').insert_link({ i=true })<CR>
inoremap <leader>zt <cmd>:lua require('telekasten').toggle_todo({ i=true })<CR>
inoremap <leader># <cmd>lua require('telekasten').show_tags({i = true})<cr>

" ----- the following are for syntax-coloring [[links]] and ==highlighted text==
" ----- (see the section about coloring in README.md)

" for gruvbox
hi tklink ctermfg=72 guifg=#689d6a cterm=bold,underline gui=bold,underline
hi tkBrackets ctermfg=gray guifg=gray

" gruvbox
hi tkHighlight ctermbg=214 ctermfg=124 cterm=bold guibg=#fabd2f guifg=#9d0006 gui=bold

hi link CalNavi CalRuler
hi tkTagSep ctermfg=gray guifg=gray
hi tkTag ctermfg=175 guifg=#d3869B



" DEPRICATED ==============================

" Autoinput '#include <>' in a file
" nnoremap <Leader>i i#include <><ESC>
" nnoremap <Leader>I i#include <><cr><ESC>

" remaps the <Up> key to <C-K> when in popupmenu
"imap <expr> <C-K> pumvisible() ? '<C-P>' : '<Up>'

" remaps the <Down> key to <C-J> when in popupmenu
"imap <expr> <C-J> pumvisible() ? '<C-N>' : '<Down>'

