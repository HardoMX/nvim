return {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
        'hrsh7th/cmp-buffer', -- Gets text from buffer
        'hrsh7th/cmp-path', -- Gets file paths
        'L3MON4D3/LuaSnip', -- Snippet engine
        'saadparwaiz1/cmp_luasnip', -- Autocompletion
        'rafamadriz/friendly-snippets', -- Useful snippets
    },
    config = function()
        local cmp = require('cmp')

        local luasnip = require('luasnip')

        require('luasnip.loaders.from_vscode').lazy_load()

        cmp.setup({
            completion = {
                completeopt = 'menu,menuone,preview,noselect',
            },
            snippet = { -- Configure Interaction with LuaSnip
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-k>'] = cmp.mapping.select_prev_item(), -- Previous suggestion
                ['<C-j>'] = cmp.mapping.select_next_item(), -- Next suggestion
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete(), -- Show completion suggestions
                ['<C-e>'] = cmp.mapping.abort(), -- Close completion window
                ['<CR>'] = cmp.mapping.confirm({ select = false }),
            }),
            -- Sources for autocompletion
            sources = cmp.config.sources({
                -- Sources show up in order
                { name = 'path' }, -- File paths
                { name = 'nvim_lsp' }, -- LSP
                { name = 'buffer' }, -- Text from current buffer
                { name = 'luasnip' }, -- Snippets
            }),
        })
    end,
}
