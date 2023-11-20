return {
    {
        'NvChad/nvim-colorizer.lua',
        config = function()
            require('colorizer').setup()
        end
    },
    {
        'RRethy/vim-illuminate'
    },
    {
        'm4xshen/autoclose.nvim',
        config = function ()
            require('autoclose').setup({
                options = {
                    pair_spaces = true,
                },
            })
        end
    },
    {
        'jghauser/mkdir.nvim'
    },
    {
        'sitiom/nvim-numbertoggle'
    },
    {
        'nvim-treesitter/nvim-treesitter-context'
    },
    {
        -- Does not work correctly
        'wakatime/vim-wakatime',
        lazy = false,
    },
    {
        'numToStr/FTerm.nvim',
        config = function ()
            require('FTerm').setup({
                border = 'rounded',
                auto_close = false,
                dimensions = {
                    height = 0.9,
                    width = 0.9,
                },
            })
        end
    },
    {
        'moll/vim-bbye'
    },
    {
        'https://gitlab.com/HiPhish/rainbow-delimiters.nvim'
    },
}
