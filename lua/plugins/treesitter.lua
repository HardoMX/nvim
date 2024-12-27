return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        keys = {
            { "gnn", desc = "Init selection" },
            { "grn", desc = "Increment node" },
            { "grc", desc = "Increment scope" },
            { "grm", desc = "Decrement node" },
        },
        config = function()
            ---@diagnostic disable-next-line: missing-fields
            require("nvim-treesitter.configs").setup({
                ensure_installed = { "c", "cpp", "lua", "bash", "vim", "vimdoc", "python", "markdown", "markdown_inline", "html", "css", "scss", "javascript", "typescript", "json", "yaml", "yuck", "regex", "go", "toml", "xml", "dockerfile", "sql" },
                hightlight = { enable = true },
                indent = { enable = true },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "<c-space>",
                        node_incremental = "<c-space>",
                        scope_incremental = "gsi",
                        node_decremental = "<bs>",
                    },
                },
            })
        end
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
