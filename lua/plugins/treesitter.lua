return {
    'nvim-treesitter/nvim-treesitter',
    dependecies = {
        'ahmedkhalf/project.nvim',
        'nvim-treesitter/nvim-treesitter-textobjects',
        'nvim-treesitter/nvim-treesitter-context',
    },
    version = false,
    build = ':TSUpdate',
    lazy = true,
    event = {'BufReadPre', 'BufNewFile'},
    -- setup commands for treesitter
    init = function (_)
        vim.treesitter.language.register(
            'markdown',
            {
                'book',
                'md'
            }
        )
    end,
    ---@type TSConfig
    opts = {
        ensure_installed = {
            'markdown',
            'rust',
            'vim',
            'lua',
            'cpp',
            --- 'c_sharp',
            'java',
            'cmake',
            'css',
            'html',
            'python',
            'go',
            'javascript',
            'typescript',
            --- 'vue',
            'yaml'
        },
        sync_install = false,
        auto_install = true,
        highlight = {
            enable = true,
            disable = {
                "tmux",
            }
        },
        -- this doesn't work very well for me, so we are going to
        -- disable this for now
        indent = {
            enable = true,
        },
        incremental_selection = {
            enabled = true,
            keymaps = {
                init_selection = "gnn",
                node_incremental = "grn",
                scope_incremental = "grc",
                node_decremental = "grm",
            },
        }
    },
    config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)
    end,
}
