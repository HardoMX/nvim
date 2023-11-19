return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        local lualine = require('lualine')

        lualine.setup({
            options = {
                theme = 'auto',
                icons_enabled = true,
                component_separators = { left = '', right = ''},
                section_separators = { left = '', right = ''},
            },
            tabline = {
                lualine_a = { 'buffers' },
                lualine_z = { 'tabs' },
            },
            winbar = {
                lualine_c = { 'filename' },
            },
            inactive_winbar = {
                lualine_c = { 'filename' },
            },
            extensions = {
                'nvim-tree'
            },
        })
    end
}
