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

                    if client.supports_method("textDocument/formatting", 0) then
                        vim.api.nvim_create_autocmd("BufWritePre", {
                            buffer = args.buf,
                            callback = function()
                                vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
                            end
                        })
                    end
                end,
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
        "antosha417/nvim-lsp-file-operations",
        lazy = true,
        config = true
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
    }
}
