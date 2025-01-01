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
                ensure_installed = {
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
                    "sql" },
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
                textobjects = {
                    select = {
                        enable = true,
                        lookahead = true,
                        keymaps = {
                            ["of"] = { query = "@function.outer", desc = "Select outer part of function" },
                            ["if"] = { query = "@function.inner", desc = "Select inner part of function" },
                            ["oc"] = { query = "@class.outer", desc = "Select outer part of class" },
                            ["ic"] = { query = "@class.inner", desc = "Select inner part of class" },
                            ["ob"] = { query = "@block.outer", desc = "Select outer part of block" },
                            ["ib"] = { query = "@block.inner", desc = "Select inner part of block" },
                            ["ol"] = { query = "@loop.outer", desc = "Select outer part of loop" },
                            ["il"] = { query = "@loop.inner", desc = "Select inner part of loop" },
                        }
                    },
                    swap = {
                        enable = true,
                        swap_next = {
                            ["snf"] = { query = "@function.outer", desc = "Swap with next function" },
                            ["snc"] = { query = "@class.outer", desc = "Swap with next class" },
                            ["snp"] = { query = "@parameter.inner", desc = "Swap with next parameter" },
                            ["snl"] = { query = "@loop.outer", desc = "Swap with next loop" },
                            ["snb"] = { query = "@block.outer", desc = "Swap with next block" },
                        },
                        swap_previous = {
                            ["spf"] = { query = "@function.outer", desc = "Swap with previous function" },
                            ["spc"] = { query = "@class.outer", desc = "Swap with previous class" },
                            ["spp"] = { query = "@parameter.inner", desc = "Swap with previous parameter" },
                            ["spl"] = { query = "@loop.outer", desc = "Swap with previous loop" },
                            ["spb"] = { query = "@block.outer", desc = "Swap with previous block" },
                        }
                    },
                    move = {
                        enable = true,
                        set_jumps = true,
                        goto_next = {
                            ["gnf"] = { query = "@function.outer", desc = "Next function start" },
                            ["gnc"] = { query = "@class.outer", desc = "Next class start" },
                            ["gnl"] = { query = "@loop.outer", desc = "Next loop start" },
                            ["gnb"] = { query = "@block.outer", desc = "Next block start" },
                        },
                        goto_previous = {
                            ["gpf"] = { query = "@function.outer", desc = "Previous function start" },
                            ["gpc"] = { query = "@class.outer", desc = "Previous class start" },
                            ["gpl"] = { query = "@loop.outer", desc = "Previous loop start" },
                            ["gpb"] = { query = "@block.outer", desc = "Previous block start" },
                        }
                    }
                }
            })
        end
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        event = "UIEnter",
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
    }
}
