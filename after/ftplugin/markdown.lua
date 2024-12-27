local cmp = require("cmp")
local lspkind = require("lspkind")

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
        { name = "emoji" },
        { name = "nerdfont" },
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
                emoji = "[Emoji]",
                nerdfont = "[NF]",
            })
        })
    },

    experimental = {
        ghost_text = true,
    },
})
