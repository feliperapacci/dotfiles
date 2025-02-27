return {
  'mfussenegger/nvim-dap',
  dependencies = {
    'rcarriga/nvim-dap-ui',
    'nvim-neotest/nvim-nio',
  },

  config = function ()
    local dap = require("dap")
    local dapui =  require("dapui")

    require("dapui").setup()

    -- DapUI listeners
    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
     dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
--    dap.listeners.before.event_exited.dapui_config = function()
--      dapui.close()
--    end

    -- Remaps
    vim.keymap.set('n', '<Leader>db', function() dap.toggle_breakpoint() end)
    vim.keymap.set('n', "<Leader>dc", function() dap.continue() end)

    -- C/C++/Rust (install codelldb through :Mason)
    local mason_registry = require("mason-registry")
    local codelldb = mason_registry.get_package("codelldb")
    local extension_path = codelldb:get_install_path() .. "/extension/"
    local codelldb_path = extension_path .. "adapter/codelldb"

    dap.adapters.codelldb = {
      type = 'executable',
      command = codelldb_path,
    }
    dap.configurations.cpp = {
      {
        name = 'Launch file',
        type = 'codelldb',
        request = 'launch',
        program = function()
          return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = true,
        args = {},
      },
    }

    dap.configurations.c = dap.configurations.cpp
    dap.configurations.rust = dap.configurations.cpp

  end
}
