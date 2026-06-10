return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        lazy = false,
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter").install({
                "c",
                "cpp",
                "lua",
                "bash",
                "vim",
                "vimdoc",
                "python",
                "markdown",
                "markdown_inline",
                "html",
                "css",
                "scss",
                "javascript",
                "typescript",
                "json",
                "yaml",
                "yuck",
                "regex",
                "go",
                "toml",
                "xml",
                "dockerfile",
                "sql" })
        end
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        event = "UIEnter",
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        branch = "main",
        init = function()
            vim.g.no_plugin_maps = true
        end,
        config = function()
            require("nvim-treesitter-textobjects").setup({
                select = {
                    lookahead = true,
                },
                move = {
                    set_jumps = true,
                },
            })
        end,
    }
}
