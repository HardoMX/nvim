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
}
