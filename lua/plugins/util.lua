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
    },
    {
        "monaqa/dial.nvim",
        config = function()
            local augend = require("dial.augend")
            require("dial.config").augends:register_group {
                default = {
                    augend.integer.alias.decimal,
                    augend.integer.alias.hex,
                    augend.constant.alias.bool,
                    augend.date.alias["%Y-%m-%d"],
                    augend.date.alias["%Y/%m/%d"],
                    augend.date.alias["%m/%d"],
                    -- augend.date.alias["%d/%m"], -- I honestly forgot if we write the month or day first on these short dates in Sweden
                    augend.date.alias["%H:%M"],
                }
            }
        end
    },
    {
        "stevearc/oil.nvim",
        opts = {
            columns = {
                "icon",
                "permissions",
                "size",
            },
            watch_for_changes = true,
            view_options = {
                show_hidden = true,
            },
            float = {
                padding = 3,
                max_width = 200,
                preview_split = "right",
            }
        }
    },
    {
        "nvim-tree/nvim-tree.lua",
        lazy = true,
        opts = {
            filters = {
                dotfiles = true,
            }
        }
    },
    {
        "Xemptuous/sqlua.nvim",
        lazy = true,
        cmd = "SQLua",
        opts = {}
    }
}
