return {
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("harpoon"):setup()
        end
    },
    {
        "kylechui/nvim-surround",
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup()
        end
    },
    {
        "m4xshen/autoclose.nvim",
        config = function ()
            require("autoclose").setup({
                disable_when_touch = true,
                pair_spaces = true
            })
        end
    },
    {
        "NMAC427/guess-indent.nvim",
        config = function()
            require("guess-indent").setup()
        end
    },
    {
        "bennypowers/nvim-regexplainer",
        dependencies = { 
            "nvim-treesitter/nvim-treesitter",
            "MunifTanjim/nui.nvim"
        },
        config = function()
            require("regexplainer").setup({
                auto = true,
            })
        end
    }
}
