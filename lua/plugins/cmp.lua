return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-buffer",        -- Suggestions from current buffer
        "hrsh7th/cmp-path",          -- Suggest file paths
        "saadparwaiz1/cmp_luasnip",  -- Integrate luasnip with cmp
        "hrsh7th/cmp-emoji",         -- Suggest markdown emojis
        "chrisgrieser/cmp-nerdfont", -- Suggest nerdfont icons
        "onsails/lspkind.nvim",      -- Add pictograms for different LSP types
        "hrsh7th/cmp-nvim-lsp",      -- Add LSP untegration
        -- currently broken: "Jezda1337/nvim-html-css", -- CSS intellisense for html
    },
    config = function()
        local cmp = require("cmp")
        local lspkind = require("lspkind")

        require("luasnip.loaders.from_vscode").lazy_load()

        cmp.setup({
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },

            sources = cmp.config.sources({
                { name = "path" },
                { name = "nvim_lsp" },
                { name = "luasnip" },
                { name = "nvim_lua" },
                -- Currenty broken: { name = "nvim-html-css" },
            }, {
                { name = "buffer" }
            }),

            mapping = cmp.mapping.preset.insert({
                ["<CR>"] = cmp.mapping.confirm({ select = false }),
                ["<Tab>"] = cmp.mapping.select_next_item(),
                ["<S-Tab"] = cmp.mapping.select_prev_item(),
                ["<Down>"] = cmp.mapping.select_next_item(),
                ["<Up>"] = cmp.mapping.select_prev_item(),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<ESC>"] = cmp.mapping.abort(),
            }),

            view = {
                entries = { name = "custom", selection_order = "near_cursor" }
            },

            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },

            formatting = {
                format = lspkind.cmp_format({
                    mode = "symbol_text",
                    menu = ({
                        buffer = "[Buffer]",
                        nvim_lsp = "[LSP]",
                        luasnip = "[LuaSnip]",
                        nvim_lua = "[Lua]",
                        path = "[Path]",
                    })
                })
            },

            experimental = {
                ghost_text = true,
            },
        })

        local cmp_autopairs = require("nvim-autopairs.completion.cmp")
        cmp.event:on(
            "confirm_done",
            cmp_autopairs.on_confirm_done()
        )

        -- Currently broken: require("html-css"):setup()
    end
}
