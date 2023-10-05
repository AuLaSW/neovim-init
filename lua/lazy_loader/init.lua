-- this will load lazy.nvim, the plugin manager I plan on moving to
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

require('utils.keymaps').leader()

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require('lazy').setup(
    'plugins',
    {
        change_detection = {
            -- Do not notify when a plugin is changed and reloaded.
            notify = false,
        },
    }
)
