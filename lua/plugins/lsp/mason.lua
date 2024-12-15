return {
    "williamboman/mason.nvim",
    dependencies = "williamboman/mason-lspconfig.nvim",
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
    end
}
