return {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
        {
            'SmiteshP/nvim-navbuddy',
            dependencies = {
                'SmiteshP/nvim-navic'
            },
            opts = { lsp = { auto_attach = true } }
        },
        'hrsh7th/cmp-nvim-lsp',
        { 'antosha417/nvim-lsp-file-operations', config = true}
    },
    config = function()
        -- Import lspconfig
        local lspconfig = require('lspconfig')

        -- Import cmp-nvim-lsp
        local cmp_nvim_lsp = require('cmp_nvim_lsp')

        local keymap = vim.keymap

        local opts = { noremap = true, silent = true }
        local on_attach = function(client, bufnr)
            opts.buffer = bufnr

            -- Set keybinds
            opts.desc = 'Show LSP references'
            keymap.set('n', 'gR', '<cmd>Telescope lsp_references<CR>', opts)

            opts.desc = 'Go to declaration'
            keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)

            opts.desc = 'Show LSP definitions'
            keymap.set('n', 'gd', '<cmd>Telescope lsp_definitions<CR>', opts)

            opts.desc = 'Show LSP implementations'
            keymap.set('n', 'gi', '<cmd>Telescope lsp_implementatinos<CR>', opts)

            opts.desc = 'Show LSP type definitions'
            keymap.set('n', 'gt', '<cmd>Telescope lsp_type_definitions<CR>', opts)

            opts.desc = 'See available code actions'
            keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)

            opts.desc = 'Smart rename'
            keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)

            opts.desc = 'Show buffer diagnostics'
            keymap.set('n', '<leader>D', '<cmd>Telescope diagnostics bufnr=0<CR>', opts)

            opts.desc = 'Show Line diagnostics'
            keymap.set('n', '<leader>d', vim.diagnostic.open_float, opts)

            opts.desc = 'Go to previous diagnostic'
            keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)

            opts.desc = 'Go to next diagnostic'
            keymap.set('n', ']d', vim.diagnostic.goto_next, opts)

            opts.desc = 'Show documentation for what is under cursor'
            keymap.set('n', 'K', vim.lsp.buf.hover, opts)

            opts.desc = 'Restart LSP'
            keymap.set('n', '<leader>rs', ':LspRestart<CR>', opts)
        end

        -- Enable autocompletion
        local capabilities = cmp_nvim_lsp.default_capabilities()

        -- Change diagnostics symbols in sign column
        local signs = { Error = ' ', Warn = '⚠ ', Hint = '🗲 ', Info = '🛈 ' }
        for type, icon in pairs(signs) do
            local hl = 'DiagnosticSign' .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
        end

        -- Configure LSP-servers
        lspconfig['html'].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        lspconfig['cssls'].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        lspconfig['cssmodules_ls'].setup({
            on_attach = on_attach
        })

        lspconfig['jsonls'].setup({
            capabilities = capabilities,
            on_attach = on_attach
        })

        lspconfig['bashls'].setup({
            on_attach = on_attach
        })

        lspconfig['clangd'].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        lspconfig['pyright'].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        lspconfig['lua_ls'].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { 'vim' },
                    },
                    workspace = {
                        library = {
                            [vim.fn.expand('@VIMRUNTIME/lua')] = true,
                            [vim.fn.stdpath('config') .. '/lua'] = true,
                        },
                    },
                },
            },
        })

        -- These are less needed servers that I use a lot
        lspconfig['marksman'].setup({})
    end,
}
