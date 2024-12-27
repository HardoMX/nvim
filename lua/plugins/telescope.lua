return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        opts = {
            extensions = {
                fzf = {},
                dap = {}
            }
        }
    },
    { "nvim-telescope/telescope-file-browser.nvim", lazy = true },
    { "nvim-lua/plenary.nvim",                      lazy = true },
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        lazy = true,
        config = function()
            require("telescope").load_extension("fzf")
            require("telescope").load_extension("refactoring")
        end
    },
    {
        "nvim-telescope/telescope-dap.nvim",
        lazy = true,
        config = function()
            require("telescope").load_extension("dap")
        end
    },
}
