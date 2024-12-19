return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        opts = {
            ensure_installed = { "c", "cpp", "lua", "bash", "vim", "vimdoc", "python", "markdown", "markdown_inline", "html", "css", "scss", "javascript", "typescript", "json", "yaml", "yuck", "regex", "go", "toml", "xml", "dockerfile", "sql" },
            hightlight = { enable = true },
            indent = { enable = true },
        }
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        event = "UIEnter",
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        lazy = true,
    }
}
