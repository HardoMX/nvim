return {
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            local lspconfig = require("lspconfig")

            lspconfig.util.default_config = vim.tbl_extend(
                'force',
                lspconfig.util.default_config,
                {
                    capabilities = vim.tbl_deep_extend(
                        'force',
                        vim.lsp.protocol.make_client_capabilities(),
                        require("lsp-file-operations").default_capabilities()
                    )
                }
            )
        end
    },
    {
        "folke/lazydev.nvim",
        lazy = true,
        ft = "lua",
        opts = {
            library = {
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            },
        },
    },
    {
        "folke/trouble.nvim",
        lazy = true,
        cmd = "Trouble"
    },
    {
        "rachartier/tiny-inline-diagnostic.nvim",
        event = "VeryLazy",
        priority = 1000,
        opts = {
            options = {
                use_icons_from_diagnostic = true,
                multiple_diag_under_cursor = true,
                multilines = {
                    enabled = true,
                    always_show = true,
                },
                add_messages = false,
                show_all_dags_on_cursorline = true,
            }
        }
    },
    {
        "dnlhc/glance.nvim",
        event = { "LspAttach" },
        opts = {
            border = {
                enable = true
            },
            hooks = {
                before_open = function(results, open, jump, method)
                    if #results == 1 then
                        jump(results[1])
                    else
                        open(results)
                    end
                end,
            },
            use_trouble_qf = true
        }
    }
}
