local M = {
  "mfussenegger/nvim-dap",
  commit = "7c1d47cf7188fc31acdf951f9eee22da9d479152",
  event = "VeryLazy",
}

function M.config()
  local dap = require "dap"

  local dap_ui_status_ok, dapui = pcall(require, "dapui")
  if not dap_ui_status_ok then
    return
  end

  dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
  end

  dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
  end

  dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
  end

  -- C language adapters
  dap.adapters.codelldb = {
    type = "server",
    port = "${port}",
    executable = {
      -- provide the absolute path for `codelldb` command if not using the one installed using `mason.nvim`
      command = "codelldb",
      args = { "--port", "${port}" },
      -- On windows you may have to uncomment this:
      -- detached = false,
    },
  }
  dap.configurations.c = {
    {
      name = "Launch file",
      type = "codelldb",
      request = "launch",
      program = function()
        local path
        vim.ui.input({ prompt = "Path to executable: ", default = vim.loop.cwd() .. "/build/" }, function(input)
          path = input
        end)
        vim.cmd [[redraw]]
        return path
      end,
      cwd = "${workspaceFolder}",
      stopOnEntry = false,
    },
  }

  -- Python adapter, all python packages must be installed for this adapter
  dap.adapters.python = function(cb, config)
    if config.request == "attach" then
      ---@diagnostic disable-next-line: undefined-field
      local port = (config.connect or config).port
      ---@diagnostic disable-next-line: undefined-field
      local host = (config.connect or config).host or "127.0.0.1"
      cb {
        type = "server",
        port = assert(port, "`connect.port` is required for a python `attach` configuration"),
        host = host,
        options = {
          source_filetype = "python",
        },
      }
    else
      cb {
        type = "executable",
        command = os.getenv "HOME" .. "/.virtualenvs/debugpy/bin/python",
        args = { "-m", "debugpy.adapter" },
        options = {
          source_filetype = "python",
        },
      }
    end
  end

  -- Read a VScode launch.json file
  require("dap.ext.vscode").load_launchjs()
end

return M
