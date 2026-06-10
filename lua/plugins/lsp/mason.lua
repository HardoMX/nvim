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
    --[[{
        "jay-babu/mason-nvim-dap.nvim",
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
    --]]
}
