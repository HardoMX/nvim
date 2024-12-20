return {
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        config = function()
            require("harpoon"):setup()
        end
    },
    {
        "NMAC427/guess-indent.nvim",
        opts = {}
    },
    {
        "bennypowers/nvim-regexplainer",
        lazy = true,
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "MunifTanjim/nui.nvim"
        },
        opts = {
            auto = true,
        }
    },
    {
        "mbbill/undotree",
    }
}
