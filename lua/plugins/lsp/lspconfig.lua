return {
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            local lsp = require("lspconfig")
            local capab = require("cmp_nvim_lsp").default_capabilities()

            local signs = { Error = "", Warn = "⚠", Hint = "🗲", Info = "󰋽" }
            for type, icon in pairs(signs) do
                local hl = "DiagnosticSign" .. type
                vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
            end


            vim.api.nvim_create_autocmd('LspAttach', {
                callback = function(args)
                    local client = vim.lsp.get_client_by_id(args.data.client_id)
                    if not client then return end

                    if vim.fn.expand('%') ~= "keymap.c" then -- Remove autoformatting for qmk-keymap file
                        if client.supports_method("textDocument/formatting", 0) then
                            vim.api.nvim_create_autocmd("BufWritePre", {
                                buffer = args.buf,
                                callback = function()
                                    vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
                                end
                            })
                        end
                    end
                end,
            })

            vim.diagnostic.config({
                virtual_text = false,
                signs = {
                    text = {
                        [vim.diagnostic.severity.ERROR] = signs.Error,
                        [vim.diagnostic.severity.WARN] = signs.Warn,
                        [vim.diagnostic.severity.INFO] = signs.Info,
                        [vim.diagnostic.severity.HINT] = signs.Hint,
                    }
                },
                underline = true,
            })

            lsp.lua_ls.setup { capabilities = capab }
            lsp.bashls.setup { capabilities = capab }
            lsp.clangd.setup { capabilities = capab }
            lsp.pylsp.setup {
                capabilities = capab,
                settings = {
                    pylsp = {
                        plugins = {
                            pycodestyle = {
                                maxLineLength = 100,
                                indentSize = 4
                            },
                            pydocstyle = {
                                enabled = true,
                                convention = "google"
                            }
                        }
                    }
                }
            }
            lsp.vimls.setup { capabilities = capab }
            lsp.gopls.setup { capabilities = capab }
            lsp.ansiblels.setup { capabilities = capab }
            lsp.terraformls.setup { capabilities = capab }
            lsp.html.setup { capabilities = capab }
            lsp.marksman.setup { capabilities = capab }
            lsp.yamlls.setup { capabilities = capab }
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
