" Austin's init.vim file
" set up 11-6-21

"let g:python3_host_prog = 'C:\Users\ferns\AppData\Local\Programs\Python\Python310\python3.exe'


" =============== Plugins ===============

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
Plug 'kyazdani42/nvim-web-devicons' " for file icons
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

lua << EOF
require('setup').setup()
--require('dap')

--require('overseer').setup()

--require('config.dap.cpp').setup()
--require('config.dap.csharp').setup()
EOF

filetype plugin on

" vim-test ==============================================

let test#strategy = "floaterm"

" Comment.nvim ==========================================
lua << EOF
require('Comment').setup()
EOF

" trouble.nvim ==========================================
lua << EOF
require('trouble').setup{
    icons = false,
    fold_open = "v", -- icon used for open folds
    fold_closed = ">", -- icon used for closed folds
    signs = {
        -- icons / text used for a diagnostic
        error = "",
        warning = "",
        hint = "",
        information = ""
    },
    use_diagnostic_signs = true
}
EOF

" mason.nvim SETTINGS ==================================

lua << EOF
-- this is the new lsp config
local config = require('mason')
local util = require('lspconfig/util')
-- This fixes issue with capabilities being overwritten when this was performed
-- in the same section as the cmp. all of that should be moved over to here, now
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

config.setup()
require("mason").setup()
require("mason-lspconfig").setup()

require("lspconfig").ltex.setup({
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        require("ltex_extra").setup({
            path = 'spell/',
            log_level = "trace",
            init_check = true,
            load_langs = {'en-US'}
        })
    end,
    cmd = {'ltex-ls'},
    filetypes = {'latex', 'book', 'markdown', 'text'},
    flags = {debounce_text_changes=300},
    root_dir = util.root_pattern('.git'),
})
EOF

" nvim-lspconfing SETTINGS ==============================

lua << EOF
--require("nvim-lsp-installer").setup{}
--[[
local config = require('lspconfig')
config.clangd.setup{
    filetypes = {"tpp"}
}
config.jdtls.setup{
    on_attach = on_attach
}
config.cmake.setup{
    on_attach = on_attach
}
config.csharp_ls.setup{
    on_attach = on_attach
}
config.pylsp.setup{
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        pylsp = {
            plugins = {
                autopep8 = {
                    enabled = true,
                },
                pylsp_mypy = {
                    enabled = false,
                    live_mode = true,
                    report_progress = true,
                },
                pyflakes = {
                    enabled = false
                },
                flake8 = {
                    enabled = false
                },
                pylint = {
                    enabled = true,
                    executable = 'pylint',
                    args = { '--rcfile=' .. vim.fn.getcwd() .. '\\.config\\.pylintrc' }
                },
            }
        }
    } 
}
config.quick_lint_js.setup{
    on_attach = on_attach
}
config.html.setup{
    on_attach = on_attach
}
config.cssls.setup{
    on_attach = on_attach
}
config.marksman.setup{
    on_attach = on_attach
}
config.vimls.setup{
    on_attach = on_attach
}
--]]
--config.jedi_language_server.setup{
--    root_dir = function() return vim.loop.cwd() end,
--    capabilities = capabilities,
--}
--config.omnisharp.setup{
--    cmd = {'dotnet', '/Users/ferns/Downloads/omnisharp-win-x64-net6.0/OmniSharp.exe'},
--
--    -- Enables support for reading code style, naming convention and analyzer
--    -- settings from .editorconfig.
--    enable_editorconfig_support = true,
--
--    -- If true, MSBuild project system will only load projects for files that
--    -- were opened in the editor. This setting is useful for big C# codebases
--    -- and allows for faster initialization of code navigation features only
--    -- for projects that are relevant to code that is being edited. With this
--    -- setting enabled OmniSharp may load fewer projects and may thus display
--    -- incomplete reference lists for symbols.
--    enable_ms_build_load_projects_on_demand = false,
--
--    -- Enables support for roslyn analyzers, code fixes and rulesets.
--    enable_roslyn_analyzers = false,
--
--    -- Specifies whether 'using' directives should be grouped and sorted during
--    -- document formatting.
--    organize_imports_on_format = false,
--
--    -- Enables support for showing unimported types and unimported extension
--    -- methods in completion lists. When committed, the appropriate using
--    -- directive will be added at the top of the current file. This option can
--    -- have a negative impact on initial completion responsiveness,
--    -- particularly for the first few completion sessions after opening a
--    -- solution.
--    enable_import_completion = false,
--
--    -- Specifies whether to include preview versions of the .NET SDK when
--    -- determining which version to use for project loading.
--    sdk_include_prereleases = true,
--
--    -- Only run analyzers against open files when 'enableRoslynAnalyzers' is
--    -- true
--    analyze_open_documents_only = false,
--}

vim.diagnostic.config({
    virtual_text = false,
    update_in_insert = true,
    underline = true,
})
EOF


" UltiSnips ==========

" Control jumping back and forth through triggers
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" Create custom snip directors in runtime path
let g:UltiSnipsSnippetDirectories=["UltiSnips"]

" Gruvbox SETTINGS ==============================

" lua settings
lua << EOF
vim.g.material_style = "darker"

require('material').setup({

    contrast = {
        terminal = false, -- Enable contrast for the built-in terminal
        sidebars = false, -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
        floating_windows = false, -- Enable contrast for floating windows
        cursor_line = false, -- Enable darker background for the cursor line
        non_current_windows = false, -- Enable darker background for non-current windows
        filetypes = {'book'}, -- Specify which filetypes get the contrasted (darker) background
    },

    styles = { -- Give comments style such as bold, italic, underline etc.
        comments = { --[[ italic = true ]] },
        strings = { --[[ bold = true ]] },
        keywords = { --[[ underline = true ]] },
        functions = { --[[ bold = true, undercurl = true ]] },
        variables = {},
        operators = {},
        types = {},
    },

    plugins = { -- Uncomment the plugins that you use to highlight them
        -- Available plugins:
        "dap",
        -- "dashboard",
        -- "gitsigns",
        -- "hop",
        -- "indent-blankline",
        -- "lspsaga",
        -- "mini",
        -- "neogit",
        -- "neorg",
        "nvim-cmp",
        -- "nvim-navic",
        "nvim-tree",
        "nvim-web-devicons",
        -- "sneak",
        "telescope",
        "trouble",
        -- "which-key",
    },

    disable = {
        colored_cursor = false, -- Disable the colored cursor
        borders = false, -- Disable borders between vertically split windows
        background = false, -- Prevent the theme from setting the background (NeoVim then uses your terminal background)
        term_colors = false, -- Prevent the theme from setting terminal colors
        eob_lines = false -- Hide the end-of-buffer lines
    },

    high_visibility = {
        lighter = false, -- Enable higher contrast text for lighter style
        darker = true -- Enable higher contrast text for darker style
    },

    lualine_style = "default", -- Lualine style ( can be 'stealth' or 'default' )

    async_loading = true, -- Load parts of the theme asynchronously for faster startup (turned on by default)

    custom_colors = function(colors)
        colors.editor.bg = "#282828"
        colors.editor.fg = "#ebdbb2"
        colors.editor.fg_dark = "#b8bb26"
        -- colors.editor.selection = "#928374"
        -- colors.editor.constrast = "#1d2021"
        -- colors.editor.active = "#3c3836"
        -- colors.editor.border = "#32302f"
        -- colors.editor.accent = "#ebdbb2"

        -- colors.syntax.variable = "#ebdbb2"
        -- colors.syntax.keyword = "#fabd2f"
        -- colors.syntax.value = "#d3869b"
        -- colors.syntax.operator = "#ebdbb2"
        -- colors.syntax.fn = "#8ec07c"
        -- colors.syntax.string = "#b8bb26"
        -- colors.syntax.type = "#fabd2f"

        -- colors.lsp.info = colors.main.cyan
        -- colors.lsp.warning = colors.main.red
        -- colors.lsp.hint = colors.main.yellow

        -- colors.main.white = "#fbf1c7"
        -- colors.main.gray = "#a89984"
        -- colors.main.black = "#282828"
        -- colors.main.red = "#fb4934"
        -- colors.main.green = "#b8bb26"
        -- colors.main.yellow = "#fabd2f"
        -- colors.main.blue = "#458588"
        -- colors.main.paleblue = "#83a598"
        -- colors.main.purple = "#d3869b"
        -- colors.main.orange = "#fe8019"
        -- colors.main.darkred = "#cc241d"
        -- colors.main.darkgreen = "#98971a"
        -- colors.main.darkyellow = "#d79921"
        -- colors.main.darkblue = "#458588"
        -- colors.main.darkpurple = "#b16286"
        -- colors.main.darkorange = "#d65d0e"

    end, -- If you want to override the default colors, set this to a function

    custom_highlights = { }, -- Overwrite highlights with your own
})
EOF

colorscheme gruvbox-baby
"colorscheme gruvbox-flat
"colorscheme material

" treesitter SETTINGS ==============================

lua << EOF
require('nvim-treesitter.configs').setup {
  ensure_installed = {'markdown', 'vim', 'lua', 'cpp', 'c_sharp', 'java', 'cmake', 'css', 'html', 'python', 'go', 'javascript', 'typescript', 'vue'}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
  auto_install = true,
  highlight = {
    enable = true,
  },
}

--local parsers = require "nvim-treesitter.parsers"

--local ft_to_parser = require'nvim-treesitter.parsers'.filetype_to_parsername

--ft_to_parser.book = "markdown"

vim.treesitter.language.register("markdown", {"book", "md"})
vim.api.nvim_set_hl(0, "@section.atx_heading.heading_content", {link="Identifier"})
EOF

" nvim-cmp SETTINGS ==============================

lua <<EOF
  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        -- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
      end,
    },
    mapping = {
      ['<C-L>'] = cmp.mapping.confirm({ select = true }),
      ['<C-J>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
      ['<C-K>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
      ['<Down>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
      ['<Up>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
      ['<C-D>'] = cmp.mapping.scroll_docs(-4),
      ['<C-U>'] = cmp.mapping.scroll_docs(4),
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
    }),
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

  cmp.setup.filetype({
          "dap-repl",
          "dapui_watches",
          "dapui_hover",
          },
      { 
          sources = {
              { name = "dap" },
          },
      })

  -- Setup lspconfig.
  --local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  -- C and C++ LSP
  require('lspconfig')['clangd'].setup {
    capabilities = capabilities
  }
  -- java LSP
  require('lspconfig')['jdtls'].setup {
    capabilities = capabilities
  }
  -- C# LSP
  require('lspconfig')['csharp_ls'].setup {
    capabilities = capabilities
  }
  -- html LSP
  require('lspconfig')['html'].setup {
    capabilities = capabilities
  }
  -- markdown/latex/text LSP
  --require('lspconfig')['ltex'].setup {
    --capabilities = capabilities
  --}
EOF

" vimtex ===============================

let g:tex_flavor = 'latex'
let g:vimtex_view_method = 'zathura'
let g:vimtex_quickfix_mode = 0
let conceallevel = 2

" telekasten ====================

lua << END
local home = 'C:\\Users\\ferns\\zettelkasten'
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

" vim-tree.lua

"let g:nvim_tree_git_hl = 1 "0 by default, will enable file highlight for git attributes (can be used without the icons).
"let g:nvim_tree_highlight_opened_files = 1 "0 by default, will enable folder and file icon highlight for opened files/directories.
"let g:nvim_tree_root_folder_modifier = ':~' "This is the default. See :help filename-modifiers for more options
"let g:nvim_tree_add_trailing = 1 "0 by default, append a trailing slash to folder names
"let g:nvim_tree_group_empty = 1 " 0 by default, compact folders that only contain a single folder into one node in the file tree
"let g:nvim_tree_icon_padding = ' ' "one space by default, used for rendering the space between the icon and the filename. Use with caution, it could break rendering if you set an empty string depending on your font.
"let g:nvim_tree_symlink_arrow = ' >> ' " defaults to ' ➛ '. used as a separator between symlinks' source and target.
"let g:nvim_tree_respect_buf_cwd = 1 "0 by default, will change cwd of nvim-tree to that of new buffer's when opening nvim-tree.
"let g:nvim_tree_create_in_closed_folder = 1 "0 by default, When creating files, sets the path of a file when cursor is on a closed folder to the parent folder when 0, and inside the folder when 1.
"let g:nvim_tree_special_files = { 'README.md': 1, 'Makefile': 1, 'MAKEFILE': 1 } " List of filenames that gets highlighted with NvimTreeSpecialFile
"let g:nvim_tree_show_icons = {
    "\ 'git': 1,
    "\ 'folders': 0,
    "\ 'files': 0,
    "\ 'folder_arrows': 0,
    "\ }
"
"let g:nvim_tree_icons = {
    "\ 'default': "",
    "\ 'symlink': "",
    "\ 'git': {
    "\   'unstaged': "",
    "\   'staged': "",
    "\   'unmerged': "",
    "\   'renamed': "",
    "\   'untracked': "",
    "\   'deleted': "",
    "\   'ignored': ""
    "\   },
    "\ 'folder': {
    "\   'arrow_open': "",
    "\   'arrow_closed': "",
    "\   'default': "",
    "\   'open': "",
    "\   'empty': "",
    "\   'empty_open': "",
    "\   'symlink': "",
    "\   'symlink_open': "",
    "\   }
    "\ }

" a list of groups can be found at `:help nvim_tree_highlight`
highlight NvimTreeFolderIcon guibg=blue

lua << EOF
require ('nvim-tree').setup {}
require ('nvim-web-devicons').setup {
    default = true;
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

" spelling fix suggestons
nnoremap ss z=

" spelling prev error
nnoremap <Leader>N [s

" spelling next error
nnoremap <Leader>n ]s

" lsp maps
lua << EOF
-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

vim.api.nvim_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
vim.api.nvim_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
vim.api.nvim_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
vim.api.nvim_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
vim.api.nvim_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

EOF

" jdtls

nnoremap <A-o> <Cmd>lua require'jdtls'.organize_imports()<CR>
nnoremap crv <Cmd>lua require('jdtls').extract_variable()<CR>
vnoremap crv <Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>
nnoremap crc <Cmd>lua require('jdtls').extract_constant()<CR>
vnoremap crc <Esc><Cmd>lua require('jdtls').extract_constant(true)<CR>
vnoremap crm <Esc><Cmd>lua require('jdtls').extract_method(true)<CR>

" vim-table-mode ==============================

noremap <Leader>tm :TableModeToggle

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

"
" nvim-tree.lua remaps

nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>

" trouble

nnoremap <leader>xx <cmd>TroubleToggle<cr>
nnoremap <leader>xw <cmd>TroubleToggle workspace_diagnostics<cr>
nnoremap <leader>xd <cmd>TroubleToggle document_diagnostics<cr>
nnoremap <leader>xq <cmd>TroubleToggle quickfix<cr>
nnoremap <leader>xl <cmd>TroubleToggle loclist<cr>
nnoremap gR <cmd>TroubleToggle lsp_references<cr>

" Vimspector

nnoremap <leader>da :call vimspector#Launch()<CR>
nnoremap <leader>dx :call vimspector#Reset()<CR>
"nnoremap <S-k> :call vimspector#StepOut()<CR>
"nnoremap <S-l> :call vimspector#StepInto()<CR>
"nnoremap <S-j> :call vimspector#StepOver()<CR>
nnoremap <leader>d_ :call vimspector#Restart()<CR>
nnoremap <leader>dn :call vimspector#Continue()<CR>
nnoremap <leader>drc :call vimspector#RunToCursor()<CR>
nnoremap <leader>dh :call vimspector#ToggleBreakpoint()<CR>
nnoremap <leader>de :call vimspector#toggleconditionalBreakpoint()<CR>
nnoremap <leader>dX :call vimspector#ClearBreakPoints()<CR>
nnoremap <leader>d? :call AddToWatch()<CR>
nnoremap <leader>regen ggVGgq

func! AddToWatch()
    let word = expand("<cexpr>")
    call vimspector#AddWatch(word)
endfunction
let g:vimspector_base_dir = expand('$HOME/.config/vimspector-config')

" vim-test

nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

nmap <silent> <F5> :FloatermNew python %<CR>
nmap <silent> <F9> :FloatermNew python -m unittest discover<CR>

" opening current html file

nmap <silent> <F12> :silent !start chrome "%"<CR>

lua << EOF
function start_local_http()
    cwd = vim.fn.expand('%:p:h')
    vim.api.nvim_command(":tabnew")
    vim.api.nvim_command(":terminal python -m http.server 8080 -d \"" .. cwd .. "\"")
    vim.api.nvim_command(":tabprev")
end
EOF


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

" error colors
hi DiagnosticUnderlineInfo guifg=#7fa2ac cterm=underline gui=underline



" DEPRICATED ==============================

" Autoinput '#include <>' in a file
" nnoremap <Leader>i i#include <><ESC>
" nnoremap <Leader>I i#include <><cr><ESC>

" remaps the <Up> key to <C-K> when in popupmenu
"imap <expr> <C-K> pumvisible() ? '<C-P>' : '<Up>'

" remaps the <Down> key to <C-J> when in popupmenu
"imap <expr> <C-J> pumvisible() ? '<C-N>' : '<Down>'
set nospell
