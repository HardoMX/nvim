return {
    {
        "williamboman/mason.nvim",
        opts = {
            ui = {
                border = "rounded",
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                }
            }
        },
    },
    {
        "williamboman/mason-lspconfig.nvim",
        -- lazy = true,
        opts = {
            -- Change these as you like. I do a lot of varied stuff, so have a lot of "necessary" LSPs
            ensure_installed = {
                "lua_ls",
                "bashls",
                "clangd",
                "pylsp",
                "vimls",
                "gopls",
                "ansiblels",
                "terraformls",
                "html",
                "marksman",
                "yamlls"
            }
        },
    },
    {
        "jay-babu/mason-nvim-dap.nvim",
        dependencies = "mason.nvim",
        -- lazy = true,
        opts = {
            ensure_installed = {
                "python",
                "cppdbg",
                "delve",
                "firefox",
                "bash",
            },
        }
    }
}
