return {
    'ThePrimeagen/harpoon',
    lazy = true,
    event = 'VeryLazy',
    config = function()
        require('harpoon').setup()
        require("telescope").load_extension('harpoon')
    end
}
