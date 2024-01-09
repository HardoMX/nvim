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
    {
        'petertriho/nvim-scrollbar',
        config = function ()
            require('scrollbar').setup()
        end
    },
    {
        'folke/trouble.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = {},
    },
    {
        'nmac427/guess-indent.nvim',
        config = function()
            require('guess-indent').setup{}
        end
    },
    {
        'andweeb/presence.nvim',
        config = function()
            require('presence').setup({
                neovim_image_text = "I use Arch BTW", --I actually do
                editing_text = "Coding in %s",
            })
        end
    }
}
