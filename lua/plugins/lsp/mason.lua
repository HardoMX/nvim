return {
    'williamboman/mason.nvim',
    dependencies = {
        'williamboman/mason-lspconfig.nvim',
    },
    config = function()
        -- Import mason
        local mason = require('mason')

        -- Import mason-lspconfig
        local mason_lspconfig = require('mason-lspconfig')

        -- Enable mason and configure icons
        mason.setup({
            ui = {
                icons = {
                    package_installed = '✓',
                    package_pending = '→',
                    package_uninstalled = '⨯',
                },
            },
        })

        mason_lspconfig.setup({
            -- LSP servers for mason to install
            ensure_installed = {
                -- Can install more with :LspInstall <language>
                'bashls',
                'clangd',
                'cssls',
                'cssmodules_ls',
                'html',
                'jsonls',
                'lua_ls',
                'pyright',
                'marksman'
            },
            -- Automatically install configured servers with lspconfig
            automatic_installation = true,
        })
    end,
}
