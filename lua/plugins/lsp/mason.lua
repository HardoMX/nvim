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
            -- Change these as you like. I do a lot of varied stuff, so have a lot of "necessary" LSPs.
            -- These are automatically enabled, thus enabling through config/lsp.lua is not strictly necessary
            ensure_installed = {
                -- "Necessary" languages
                "lua_ls",
                "bashls",
                "clangd",
                "pylsp",
                "vimls",
                "gopls",
                "html",
                "cssls",
                "yamlls",
                -- Extra languages (Change as needed)
                "ansiblels",
                "terraformls",
                "marksman",
                "css_variables",
                "cssmodules_ls",
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
