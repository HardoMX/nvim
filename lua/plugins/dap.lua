return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "nvim-neotest/nvim-nio",
        "theHamsta/nvim-dap-virtual-text",
        "LiadOz/nvim-dap-repl-highlights",
    },
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
        -- If my pull request to mason-nvim-dap is approved this will no longer be necessary
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
                pathBashdb = vim.fn.stdpath("data") .. '/mason/packages/bash-debug-adapter/extension/bashdb_dir/bashdb',
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
    end
}
