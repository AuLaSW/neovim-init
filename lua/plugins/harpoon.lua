return {
    'ThePrimeagen/harpoon',
    lazy = true,
    event = 'VeryLazy',
    config = function()
        require('harpoon').setup()
        require("telescope").load_extension('harpoon')

        -- keymaps
        local mark = require('harpoon.mark')
        local ui = require('harpoon.ui')

        vim.keymap.set({'n'}, '<leader>h', function() ui.toggle_quick_menu() end)
        vim.keymap.set({'n'}, '<leader>ho', function()
            local buf = tonumber(vim.fn.input('Mark: '))
            ui.nav_file(buf)
        end)
        vim.keymap.set({'n'}, '<leader>hn', function() ui.nav_next() end)
        vim.keymap.set({'n'}, '<leader>hp', function() ui.nav_prev() end)

        vim.keymap.set({'n'}, '<leader>a', function() mark.add_file() end)
    end
}
