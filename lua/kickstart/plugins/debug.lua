-- debug.lua
--
-- Shows how to use the DAP plugin to debug your code.
--
-- Primarily focused on configuring the debugger for Go, but can
-- be extended to other languages as well. That's why it's called
-- kickstart.nvim and not kitchen-sink.nvim ;)

return {
  -- NOTE: Yes, you can install new plugins here!
  'mfussenegger/nvim-dap',
  -- NOTE: And you can specify dependencies as well
  dependencies = {
    -- Creates a beautiful debugger UI
    'rcarriga/nvim-dap-ui',

    -- Required dependency for nvim-dap-ui
    'nvim-neotest/nvim-nio',

    -- Installs the debug adapters for you
    'williamboman/mason.nvim',
    'jay-babu/mason-nvim-dap.nvim',

    -- Add your own debuggers here
    'leoluz/nvim-dap-go',
    'mfussenegger/nvim-dap-python',
  },
  keys = {
    -- Basic debugging keymaps, feel free to change to your liking!
    {
      '<F5>',
      function()
        require('dap').continue()
      end,
      desc = 'Debug: Start/Continue',
    },
    {
      '<F1>',
      function()
        require('dap').step_into()
      end,
      desc = 'Debug: Step Into',
    },
    {
      '<F2>',
      function()
        require('dap').step_over()
      end,
      desc = 'Debug: Step Over',
    },
    {
      '<F3>',
      function()
        require('dap').step_out()
      end,
      desc = 'Debug: Step Out',
    },
    {
      '<leader>b',
      function()
        require('dap').toggle_breakpoint()
      end,
      desc = 'Debug: Toggle Breakpoint',
    },
    {
      '<leader>B',
      function()
        require('dap').set_breakpoint(vim.fn.input 'Breakpoint condition: ')
      end,
      desc = 'Debug: Set Breakpoint',
    },
    -- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
    {
      '<F7>',
      function()
        require('dapui').toggle()
      end,
      desc = 'Debug: See last session result.',
    },
  },
  config = function()
    local dap = require 'dap'
    local dapui = require 'dapui'

    require('mason-nvim-dap').setup {
      -- Makes a best effort to setup the various debuggers with
      -- reasonable debug configurations
      automatic_installation = true,

      -- You can provide additional configuration to the handlers,
      -- see mason-nvim-dap README for more information
      handlers = {
        function()
          require('dap-python').setup()
          table.insert(require('dap').configurations.python, {
            name = 'Pytest: Current File',
            type = 'python',
            request = 'launch',
            module = 'pytest',
            args = {
              '${file}',
              '-sv',
              '--log-cli-level=INFO',
              '--log-file=test_out.log',
            },
            console = 'integratedTerminal',
          })
          table.insert(require('dap').configurations.python, {
            name = 'Profile python: Current File',
            type = 'python',
            request = 'launch',
            module = 'cProfile',
            args = {
              '-o',
              '/tmp/profile.dat',
              '${file}',
            },
            console = 'integratedTerminal',
          })
        end,
      },

      -- You'll need to check that you have the required things installed
      -- online, please don't ask me how to install them :)
      ensure_installed = {
        -- Update this to ensure that you have the debuggers for the langs you want
        'delve',
        'python',
        'codelldb',
      },
    }

    -- Dap UI setup
    -- For more information, see |:help nvim-dap-ui|
    dapui.setup {
      -- Set icons to characters that are more likely to work in every terminal.
      --    Feel free to remove or use ones that you like more! :)
      --    Don't feel like these are good choices.
      icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
      controls = {
        icons = {
          pause = '⏸',
          play = '▶',
          step_into = '⏎',
          step_over = '⏭',
          step_out = '⏮',
          step_back = 'b',
          run_last = '▶▶',
          terminate = '⏹',
          disconnect = '⏏',
        },
      },
    }

    vim.api.nvim_set_hl(0, 'blue', { fg = '#2959d6', bg = '#FFFF00' })
    vim.api.nvim_set_hl(0, 'green', { fg = '#9ece6a', bg = '#FFFF00' })
    vim.api.nvim_set_hl(0, 'yellow', { fg = '#ffcc00', bg = '#FFFa05' })
    vim.api.nvim_set_hl(0, 'black', { fg = '#000000', bg = '#FFFF00' })
    vim.fn.sign_define('DapBreakpoint', { text = '🐞', texthl = 'blue', linehl = 'black', numhl = 'yellow' })
    vim.fn.sign_define('DapStopped', { text = '', texthl = 'green', linehl = 'black', numhl = 'yellow' })
    

    -- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
    vim.keymap.set('n', '<F7>', dapui.toggle, { desc = 'Debug: See last session result.' })

    -- Change breakpoint icons
    -- vim.api.nvim_set_hl(0, 'DapBreak', { fg = '#e51400' })
    -- vim.api.nvim_set_hl(0, 'DapStop', { fg = '#ffcc00' })
    -- local breakpoint_icons = vim.g.have_nerd_font
    --     and { Breakpoint = '', BreakpointCondition = '', BreakpointRejected = '', LogPoint = '', Stopped = '' }
    --   or { Breakpoint = '●', BreakpointCondition = '⊜', BreakpointRejected = '⊘', LogPoint = '◆', Stopped = '⭔' }
    -- for type, icon in pairs(breakpoint_icons) do
    --   local tp = 'Dap' .. type
    --   local hl = (type == 'Stopped') and 'DapStop' or 'DapBreak'
    --   vim.fn.sign_define(tp, { text = icon, texthl = hl, numhl = hl })
    -- end
    --
    dap.listeners.after.event_initialized['dapui_config'] = dapui.open
    dap.listeners.before.event_terminated['dapui_config'] = dapui.close
    dap.listeners.before.event_exited['dapui_config'] = dapui.close

    -- Install golang specific config
    require('dap-go').setup {
      delve = {
        -- On Windows delve must be run attached or it crashes.
        -- See https://github.com/leoluz/nvim-dap-go/blob/main/README.md#configuring
        detached = vim.fn.has 'win32' == 0,
      },
    }

    dap.adapters.codelldb = {
      type = 'server',
      port = '${port}',
      executable = {
        command = '/home/flavien/.local/extension/adapter/codelldb',
        args = { '--port', '${port}' },
      },
    }

    -- dap.adapters.codelldb = function(on_adapter)
    --   -- This asks the system for a free port
    --   local tcp = vim.loop.new_tcp()
    --   tcp:bind('127.0.0.1', 0)
    --   local port = tcp:getsockname().port
    --   tcp:shutdown()
    --   tcp:close()
    --
    --   -- Start codelldb with the port
    --   local stdout = vim.loop.new_pipe(false)
    --   local stderr = vim.loop.new_pipe(false)
    --   local opts = {
    --     stdio = { nil, stdout, stderr },
    --     args = { '--port', tostring(port) },
    --   }
    --   local handle
    --   local pid_or_err
    --   handle, pid_or_err = vim.loop.spawn('/usr/bin/codelldb', opts, function(code)
    --     stdout:close()
    --     stderr:close()
    --     handle:close()
    --     if code ~= 0 then
    --       print('codelldb exited with code', code)
    --     end
    --   end)
    --   if not handle then
    --     vim.notify('Error running codelldb: ' .. tostring(pid_or_err), vim.log.levels.ERROR)
    --     stdout:close()
    --     stderr:close()
    --     return
    --   end
    --   vim.notify('codelldb started. pid=' .. pid_or_err)
    --   stderr:read_start(function(err, chunk)
    --     assert(not err, err)
    --     if chunk then
    --       vim.schedule(function()
    --         require('dap.repl').append(chunk)
    --       end)
    --     end
    --   end)
    --   local adapter = {
    --     type = 'server',
    --     host = '127.0.0.1',
    --     port = port,
    --   }
    --   -- 💀
    --   -- Wait for codelldb to get ready and start listening before telling nvim-dap to connect
    --   -- If you get connect errors, try to increase 500 to a higher value, or check the stderr (Open the REPL)
    --   vim.defer_fn(function()
    --     on_adapter(adapter)
    --   end, 1000)
    -- end
    --
    -- -- don't forget to compile/build with debug symbols, otherwise it won't work.
    -- dap.configurations.cpp = {
    --   {
    --     name = 'runit',
    --     type = 'codelldb',
    --     request = 'launch',
    --
    --     program = function()
    --       return vim.fn.input('', vim.fn.getcwd(), 'file')
    --     end,
    --
    --     args = { '--log_level=all' },
    --     cwd = '${workspaceFolder}',
    --     stopOnEntry = false,
    --     terminal = 'integrated',
    --
    --     pid = function()
    --       local handle = io.popen 'pgrep hw$'
    --       local result = handle:read()
    --       handle:close()
    --       return result
    --     end,
    --   },
    -- }
    --
    -- dap.configurations.c = dap.configurations.cpp
    -- dap.configurations.h = dap.configurations.cpp
    -- dap.configurations.rust = dap.configurations.cpp

    dap.configurations.cpp = {
      {
        name = 'Launch file',
        type = 'codelldb',
        request = 'launch',
        program = function()
          return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
      },
    }
end,
}
