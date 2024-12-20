return {
    {
        "petertriho/nvim-scrollbar",
        -- event = "UIEnter",
        lazy = true,
        dependencies = { "kevinhwang91/nvim-hlslens", config = function() require("scrollbar.handlers.search").setup() end },
        opts = {
            handlers = { search = true }
        }
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            options = {
                winbar = {
                    lualine_c = { "filename" }
                },
                inactive_winbar = {
                    lualine_c = { "filename" }
                }
            }
        }
    },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify"
        },
        opts = {
            lsp = {
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true
                }
            },
            presets = {
                bottom_search = true,
                command_palette = true,
                long_message_to_split = true,
                lsp_doc_border = false
            }
        }
    },
    {
        "goolord/alpha-nvim",
        config = function()
            require("alpha").setup(require("alpha.themes.dashboard").config)
        end
    },
    {
        "folke/drop.nvim",
        event = "UIEnter",
        opts = {
            themes = {
                { theme = "new_year",       from = { month = 12, day = 31 }, to = { month = 1, day = 1 } },
                { theme = "valentines_day", month = 2,                       day = 14 },
                { theme = "easter",         holiday = "easter" },
                { theme = "april_fools",    month = 4,                       day = 1 },
                { theme = "xmas",           from = { month = 12, day = 24 }, to = { month = 12, day = 25 } },
                { theme = "leaves",         from = { month = 9, day = 15 },  to = { month = 11, day = 21 } },
                { theme = "snow",           from = { month = 11, day = 22 }, to = { month = 2, day = 28 } },
                { theme = "spring",         from = { month = 3, day = 1 },   to = { month = 5, day = 31 } },
                { theme = "summer",         from = { month = 6, day = 1 },   to = { month = 9, day = 14 } }
            },
            screensaver = 1000 * 60 * 5,
            interval = 180
        }
    },
    {
        "folke/todo-comments.nvim",
        event = "UIEnter",
        opts = {}
    },
    {
        "shellRaining/hlchunk.nvim",
        event = { "UIEnter" },
        opts = {
            chunk = {
                enable = true,
                delay = 50,
                duration = 50
            },
            indent = {
                enable = true
            },
            line_num = {
                enable = true
            }
        }
    },
    {
        "NvChad/nvim-colorizer.lua",
        event = "UIEnter",
        opts = {}
    },
    {
        "RRethy/vim-illuminate",
        event = "UIEnter",
    },
    {
        "sitiom/nvim-numbertoggle",
        event = "UIEnter",
    },
    {
        "https://gitlab.com/HiPhish/rainbow-delimiters.nvim",
        event = "UIEnter",
    },
    {
        "tzachar/highlight-undo.nvim",
        event = "UIEnter",
        opts = {}
    }
}
