return {
    'nvim-lualine/lualine.nvim',
    requires = {
        'nvim-tree/nvim-web-devicons',
    },
    config = function ()
        require('lualine').setup({
            sections = {
                lualine_x = {
                    'encoding',
                    'fileformat',
                    {
                        'filetype',
                        colored = true,
                    }
                }
            },
            tabline = {
                lualine_a = {
                    {
                        'datetime',
                        style = 'default'
                    }
                },
                lualine_b = {
                    {
                        'tabs',
                        mode = 2,
                        path = 0
                    }
                },
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = {},
            },
            --- winbar = {
            ---     lualine_a = {},
            ---     lualine_b = {'branch'},
            ---     lualine_c = {'filename'},
            ---     lualine_x = {},
            ---     lualine_y = {},
            ---     lualine_z = {},
            --- },
            extensions = {
                'trouble'
            }
        })
    end
}
