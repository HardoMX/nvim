return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-buffer", -- Suggestions from current buffer
        "hrsh7th/cmp-path", -- Suggest file paths
        "saadparwaiz1/cmp_luasnip", -- Integrate luasnip with cmp
        "hrsh7th/cmp-emoji", -- Suggest markdown emojis
        "chrisgrieser/cmp-nerdfont", -- Suggest nerdfont icons
        -- currently broken: "Jezda1337/nvim-html-css", -- CSS intellisense for html
    },
    config = function()
        local cmp = require("cmp")

        require("luasnip.loaders.from_vscode").lazy_load()

        cmp.setup({
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },

            sources = cmp.config.sources({
                { name = "path" },
                { name = "nvim-lsp" },
                { name = "luasnip" },
                { name = "emoji" },
                { name = "nerdfont" },
                { name = "nvim_lua"},
                -- Currenty broken: { name = "nvim-html-css" },
            }, {
                { name = "buffer" }
            }),

            mapping = cmp.mapping.preset.insert({
                [ "<CR>" ] = cmp.mapping.confirm({ select = true }),
                [ "<Tab>" ] = cmp.mapping.select_next_item(),
                [ "<Down>" ] = cmp.mapping.select_next_item(),
                [ "<Up>" ] = cmp.mapping.select_prev_item(),
                [ "<C-Space>" ] = cmp.mapping.complete(),
                [ "<ESC>" ] = cmp.mapping.abort(),
            })
        })

        local cmp_autopairs = require("nvim-autopairs.completion.cmp")
        cmp.event:on(
            "confirm_done",
                cmp_autopairs.on_confirm_done()
        )

        -- Currently broken: require("html-css"):setup()
    end
}
