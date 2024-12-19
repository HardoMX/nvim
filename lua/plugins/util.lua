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
        "NMAC427/guess-indent.nvim",
        config = function()
            require("guess-indent").setup()
        end
    },
    {
        "bennypowers/nvim-regexplainer",
        lazy = true,
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "MunifTanjim/nui.nvim"
        },
        config = function()
            require("regexplainer").setup({
                auto = true,
            })
        end
    },
    {
        "mbbill/undotree",
        lazy = true,
    }
}
