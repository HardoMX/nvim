return {
    "williamboman/mason.nvim",
    dependencies = { "williamboman/mason-lspconfig.nvim", "jay-babu/mason-nvim-dap.nvim" },
    config = function()
        require("mason").setup({
            ui = {
                border = "rounded",
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                }
            }
        })

        require("mason-lspconfig").setup({
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
        })

        require("mason-nvim-dap").setup({
            ensure_installed = {
                "python",
                "cppdbg",
                "delve",
                "firefox",
                "bash",
            },

            handlers = {
                function(config)
                    require("mason-nvim-dap").default_setup(config)
                end,
                -- TODO: Add configurations for specific DAP:s as required
                bash = function() end -- INFO: Disable bash default_setup since it is set in lua.plugins.dap.lua
            }
        })
    end
}
