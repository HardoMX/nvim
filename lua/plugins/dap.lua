return {
    {
        "mfussenegger/nvim-dap",
        ft = { "lua", "py", "sh", "go", "js", "ts", "c", "cpp", "cxx", "c++" },
        config = function()
            local dap = require("dap")
            local ui = require("dapui")

            ui.setup()
            require("nvim-dap-virtual-text").setup()
            require("nvim-dap-repl-highlights").setup()

            require("nvim-treesitter.configs").setup({
                ensure_installed = { "dap_repl" }
            })

            -- DAPs using mason are set up and configured in lua.plugins.lsp.mason.lua

            -- Install local-lua-debugger-vscode
            dap.adapters["local-lua"] = {
                type = "executable",
                command = "local-lua-dbg", -- INFO: If you install via a package manager, otherwise change this for comment bellow
                -- command = "node",
                -- args = { "/usr/lib/node_modules/local-lua-debugger-vscode/extension/debugAdapter.js" },
                enrich_config = function(config, on_config)
                    if not config["extensionPath"] then
                        local c = vim.deepcopy(config)
                        c.extensionPath = "/usr/lib/node_modules/local-lua-debugger-vscode/"
                        on_config(c)
                    else
                        on_config(config)
                    end
                end
            }
            dap.configurations.lua = {
                {
                    type = "local-lua",
                    name = "lua-dgb",
                    request = "launch",
                    cwd = "${workspaceFolder}",
                    program = {
                        lua = "lua",
                        file = "${file}"
                    }
                }
            }


            -- Configure bashdb (Installed through Mason)
            dap.adapters.bashdb = {
                type = "executable",
                command = vim.fn.stdpath("data") .. "/mason/packages/bash-debug-adapter/bash-debug-adapter",
                name = "bashdb"
            }
            dap.configurations.sh = {
                {
                    type = 'bashdb',
                    request = 'launch',
                    name = "Launch file",
                    showDebugOutput = true,
                    pathBashdb = vim.fn.stdpath("data") ..
                        '/mason/packages/bash-debug-adapter/extension/bashdb_dir/bashdb',
                    pathBashdbLib = vim.fn.stdpath("data") .. '/mason/packages/bash-debug-adapter/extension/bashdb_dir',
                    trace = true,
                    file = "${file}",
                    program = "${file}",
                    cwd = '${workspaceFolder}',
                    pathCat = "cat",
                    pathBash = "/bin/bash",
                    pathMkfifo = "mkfifo",
                    pathPkill = "pkill",
                    args = {},
                    env = {},
                    terminalKind = "integrated"
                }
            }


            -- Configure Firefox to ask for url and port
            dap.adapters.firefox = {
                type = "executable",
                command = vim.fn.exepath('firefox-debug-adapter'),
            }
            dap.configurations.firefox = {
                {
                    name = "Debug",
                    type = "firefox",
                    request = "launch",
                    reAttach = true,
                    url = function()
                        return vim.fn.input("URL: ", "http://localhost:")
                    end,
                    webRoot = "${workspaceFolder}",
                    firefoxExecutable = vim.fn.exepath("firefox"),
                }
            }


            -- Configure Python
            dap.adapters.python = {
                type = "executable",
                command = vim.fn.exepath("debugpy-adapter")
            }
            dap.configurations.python = {
                {
                    type = "python",
                    request = "launch",
                    name = "Launch file",
                    program = "${file}",
                    pythonPath = function()
                        local cwd = vim.fn.getcwd()
                        if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
                            return cwd .. '/venv/bin/python'
                        elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
                            return cwd .. '/.venv/bin/python'
                        else
                            return '/usr/bin/python'
                        end
                    end
                }
            }


            -- Configure C/C++
            dap.adapters.cppdbg = {
                id = "cppdbg",
                type = "executable",
                command = vim.fn.exepath("OpenDebugAD7")
            }
            dap.configurations.cpp = {
                {
                    name = "Launch file",
                    type = "cppdbg",
                    request = "launch",
                    program = function()
                        return vim.fn.input("Path to executable", vim.fn.getcwd() .. "/", "file")
                    end,
                    cwd = "${workspaceFolder}",
                    stopAdEntry = true,
                },
                {
                    name = 'Attach to gdbserver :1234',
                    type = 'cppdbg',
                    request = 'launch',
                    MIMode = 'gdb',
                    miDebuggerServerAddress = 'localhost:1234',
                    miDebuggerPath = vim.fn.exepath('gdb'),
                    cwd = '${workspaceFolder}',
                    program = function()
                        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                    end,
                }
            }


            -- Configure Delve (go)
            dap.adapters.delve = function(callback, config)
                if config.mode == "remote" and config.request == "attach" then
                    callback({
                        type = "server",
                        host = config.host or "127.0.0.1",
                        port = config.port or "38697"
                    })
                else
                    callback({
                        type = "server",
                        port = "${port}",
                        executable = {
                            command = vim.fn.exepath("dlv"),
                            args = { "dap", "-l", "127.0.0.1:${port}", "--log", "--log-output=dap" }
                        }
                    })
                end
            end
        end
    },
    { "rcarriga/nvim-dap-ui",            lazy = true },
    { "nvim-neotest/nvim-nio",           lazy = true },
    { "theHamsta/nvim-dap-virtual-text", lazy = true },
    { "LiadOz/nvim-dap-repl-highlights", lazy = true },
}
