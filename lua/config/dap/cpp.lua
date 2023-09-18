local M = {}

-- Debugger installation location
local DEBUGGER_LOCATION = "C:\\Program Files\\cpp-tool\\extension\\debugAdapters\\bin"

function M.setup()
    local dap = require("dap")

    -- Adapter configuration
    dap.adapters.cpp = {
        id = "cpp",
        type = "executable",
        command = "OpenDebugAD7",
        options = {
            detached = false
        }
    }

    -- Configuration
    dap.configurations.cpp = {
        {
            name = "Launch file",
            type = "cppdbg",
            request = "launch",
            program = function()
                return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
            end,
            cwd = '${workspaceFolder}',
            stopAtEntry = true,
        }
    }
end


